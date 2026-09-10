% run_all_setups.m

%config_base = Vehicle_Confignew();
%setups = diff_setups();

%for i = 1:length(setups)

    %config = apply_setup(config_base, setups{i});

    %results = run_diff_sim(config);

    %fprintf('Setup: %s\n', setups{i}.name);

%end

config_base = Vehicle_Confignew();
setups = diff_setups();

for i = 1:length(setups)

    config = apply_setup(config_base, setups{i});

    results = Differential_Calculator(config);

    fprintf('-----------------------------\n');
    fprintf('Setup: %s\n', setups{i}.name);
    fprintf('Max TBR: %.2f\n', max(results.TBR));
    fprintf('Final Temp: %.1f C\n', results.Temp(end));
    fprintf('-----------------------------\n\n');

end