function results = run_diff_sim(config)

% --- Time setup ---
t = linspace(0, 1, 1000); 
dt = t(2) - t(1); 

% --- Pre-compute constants ---
F_preload = config.preload_N;   % use force directly
plate_area = pi * (config.plate_outer_rad^2 - config.plate_inner_rad^2);

% --- Input profiles (mock DAQ) ---
ax_g = 0.8 * (t > 0.45);
v_mps = config.vehicle_speed * (0.8 + 0.2 * cos(pi * t));
T_motor = config.T_max_in * (ax_g / 0.8); 

% --- Initialise ---
results = struct();
curr_temp = 40;

% --- Main simulation loop ---
for i = 1:length(t)

    % --- A. Kinematics (kept for completeness) ---
    R_curr = config.corner_radius * (1 + 0.2 * sin(pi * t(i)));
    base_dw = (v_mps(i) * config.track_width) / (R_curr * config.tyre_radius);
    results.delta_omega(i) = base_dw;

    % --- B. Friction model ---
    mu_eff = config.mu_dynamic - (config.mu_temp_coefficient * (curr_temp - 40));
    mu_eff = max(mu_eff, 0.05); 

    % --- C. LSD physics ---
    T_housing = T_motor(i) * config.final_drive_ratio * config.drive_efficiency;

    if T_motor(i) >= 0
        alpha = config.alpha_accel;
    else
        alpha = config.alpha_decel;
    end

    % Scaled ramp effect (prevents domination)
    F_ax = (abs(T_housing) / config.r_ramp) * cotd(alpha) * 0.2;

    % Locking torque potential
    T_lk_potential = mu_eff * config.num_friction_faces * config.r_mean * (F_preload + F_ax);

    % ONLY limit by available torque (no tyre model)
    T_input_available = abs(T_housing);
    results.T_lk(i) = min(T_lk_potential, 0.9 * T_input_available);

    % --- D. Plate pressure ---
    results.Plate_Pressure(i) = (F_preload + F_ax) / plate_area / 1e6;

    % --- E. Thermal ---
    results.P_loss(i) = results.T_lk(i) * abs(results.delta_omega(i));
    curr_temp = curr_temp + (results.P_loss(i) * dt / config.oil_thermal_mass);
    results.Temp(i) = curr_temp;

    % --- F. TBR ---
    T_ref = max(abs(T_housing), 20);  % stabilised reference

    results.TBR(i) = (T_ref + results.T_lk(i)) / max(T_ref - results.T_lk(i), 0.1);

end

% --- Summary outputs ---
results.max_TBR = max(results.TBR);
results.max_pressure = max(results.Plate_Pressure);
results.final_temp = results.Temp(end);

end