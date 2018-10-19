run('P4p2_integral_init.m');
% y without pitch
C_se_no_pitch = [0 0 1 0 0 0;
                 0 0 0 0 1 0];

% y without travel    
C_se_no_travel = [1 0 0 0 0 0;
                  0 0 1 0 0 0];

% Calculate observability
Ob_no_pitch = obsv(A_se, C_se_no_pitch);
Ob_no_travel = obsv(A_se, C_se_no_travel);

disp(['5.4.3: Rank of observability matrix (without pitch): ', num2str(rank(Ob_no_pitch))]);
disp(['5.4.3: Rank of observability matrix (without travel): ', num2str(rank(Ob_no_travel))]);

% Adjust poles based on testing
% (Reduce poles for pitch and pitch rate)
eigs_estimator_i(1) = eigs_estimator_i(1) * 0.25;
eigs_estimator_i(2) = eigs_estimator_i(2) * 0.001;
% Place poles
L = place(A_se', C_se_no_pitch', eigs_estimator_i)';

q_1 = 15; % Pitch
q_2 = 15; % Pitch rate
q_3 = 30; % Elevation rate
q_4 = 2; % Pitch integral
q_5 = 20; % Elevation integral

Q_bar = [ q_1 0 0 0 0;
          0 q_2 0 0 0;
          0 0 q_3 0 0;
          0 0 0 q_4 0;
          0 0 0 0 q_5 ];

% LQR gain with integral effect
K_bar = lqr(A_bar, B_bar, Q_bar, R);
K = K_bar([1 2], [1 2 3]);

% Reference feed forward
P = inv(C*inv(B*K - A)*B);

%% Generate plots
genPlotFile('P4p3', 'Pitch estimate', 'Pitch [rad]', t(50:end), pitch(50:end,1), pitch(50:end,2), 'Estimated');
genPlotFile('P4p3', 'Pitch rate estimate', 'Pitch rate [rad/s]', t(50:end), pitch_rate(50:end,1), pitch_rate(50:end,2), 'Estimated');
genPlotFile('P4p3', 'Elevation estimate', 'Elevation [rad]', t(50:end), elevation(50:end,1), elevation(50:end,2), 'Estimated');
genPlotFile('P4p3', 'Elevation rate estimate', 'Elevation rate [rad/s]', t(50:end), elevation_rate(50:end,1), elevation_rate(50:end,2), 'Estimated');
genPlotFile('P4p3', 'Travel estimate', 'Travel [rad]', t, travel(:,1), travel(:,2), 'Estimated');
genPlotFile('P4p3', 'Travel rate estimate', 'Travel rate [rad/s]', t(50:end), travel_rate(50:end,1), travel_rate(50:end,2), 'Estimated');

