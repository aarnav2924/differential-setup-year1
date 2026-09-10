function config = Vehicle_Confignew()

% --- Geometry ---
config.r_ramp = 0.02;         
config.r_mean = 0.03;         

% --- Friction ---
config.mu_static = 0.12;      
config.mu_dynamic = 0.08;     
config.v_s = 0.1;             

% --- Plates ---
config.num_friction_faces = 8;

% --- Preload system ---
config.k_spring = 20000;      

% --- Thermal ---
config.C_th = 500;            
config.h = 5;                 
config.A = 0.1;               
config.T_ambient = 20;        

% --- Vehicle ---
config.m = 300;               
config.L = 1.6;               
config.h_cg = 0.25;           
config.track = 1.2;           
config.g = 9.81;              

% --- Simulation ---
config.dt = 0.01;
config.t_end = 10;

% --- Drivetrain ---
config.final_drive_ratio = 3.5;     
config.drive_efficiency  = 0.95;    
config.T_max_in          = 120;     

% --- Clutch Plate Geometry ---
config.plate_outer_rad   = 0.065;   
config.plate_inner_rad   = 0.045;   

% --- Vehicle / Corner ---
config.vehicle_speed     = 11.11;   
config.corner_radius     = 15;      

config.mass_total        = 230;     
config.cg_height         = 0.25;    
config.wheelbase         = 1.53;    
config.track_width       = 1.2;     
config.weight_dist_rear  = 0.52;    

config.tyre_radius       = 0.203;   
config.mu_tire           = 1.4;     
config.ackermann_pct     = 0.8;     

% --- Thermal ---
config.oil_thermal_mass  = 1200;    
config.mu_temp_coefficient = 0.0008;

% --- Safety ---
config.max_plate_pressure = 4.0;

% Defaults
config.alpha_accel = 45;
config.alpha_decel = 45;
config.preload_N = 1500;

% IMPORTANT: define x_deflect here too
%config.x_deflect = config.preload_N / config.k_spring;

end