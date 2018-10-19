run('P4p2_init.m');

[~, index] = max(abs(eigs_controller_i));
min_eig_i = eigs_controller_i(index);
spacing_i = spacing;
eigs_gain_factor_i = eigs_gain_factor;
eigs_estimator_i = 1:spacing_i:(1 + spacing_i*(size(A_se) - 1));
eigs_estimator_i = eigs_estimator_i * min_eig_i * eigs_gain_factor_i;
L = place(A_se', C_se', eigs_estimator_i)';

%% Generate plots
%genPlotFile('P4p2_integral', 'Pitch estimate', 'Pitch [rad]', t, pitch(:,1), pitch(:,2), 'Estimated');
%genPlotFile('P4p2_integral', 'Pitch rate estimate', 'Pitch rate [rad/s]', t, pitch_rate(:,1), pitch_rate(:,2), 'Estimated');
%genPlotFile('P4p2_integral', 'Elevation estimate', 'Elevation [rad]', t, elevation(:,1), elevation(:,2), 'Estimated');
%genPlotFile('P4p2_integral', 'Elevation rate estimate', 'Elevation rate [rad/s]', t, elevation_rate(:,1), elevation_rate(:,2), 'Estimated');
%genPlotFile('P4p2_integral', 'Travel estimate', 'Travel [rad]', t, travel(:,1), travel(:,2), 'Estimated');
%genPlotFile('P4p2_integral', 'Travel rate estimate', 'Travel rate [rad/s]', t, travel_rate(:,1), travel_rate(:,2), 'Estimated');