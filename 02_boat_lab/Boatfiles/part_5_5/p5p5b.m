%% Part 5.5 b)
sim('p5p5bx.mdl');
R_sigma_squared = var(v_measurement.data); % [degrees^2]
R = R_sigma_squared / T_s;
