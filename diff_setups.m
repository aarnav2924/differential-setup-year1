function setups = diff_setups()

setups = {};

% 1. Low Lock
s.name = 'Low Lock';
s.alpha_accel = 65;
s.alpha_decel = 65;
s.preload_N = 800;
setups{end+1} = s;

% 2. Ramp Dominant
s.name = 'Ramp Dominant';
s.alpha_accel = 35;
s.alpha_decel = 65;
s.preload_N = 800;
setups{end+1} = s;

% 3. Preload Dominant
s.name = 'Preload Dominant';
s.alpha_accel = 65;
s.alpha_decel = 65;
s.preload_N = 2500;
setups{end+1} = s;

% 4. Aggressive Lock
s.name = 'Aggressive Lock';
s.alpha_accel = 35;
s.alpha_decel = 35;
s.preload_N = 2500;
setups{end+1} = s;

% 5. Balanced
s.name = 'Balanced';
s.alpha_accel = 45;
s.alpha_decel = 45;
s.preload_N = 1500;
setups{end+1} = s;

end