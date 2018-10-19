run('../Common/constants.m');
run('../Part3/p3p3_init.m');

V_star = 6.5;

A_se = [0 1 0 0 0 0;
        0 0 0 0 0 0;
        0 0 0 1 0 0;
        0 0 0 0 0 0;
        0 0 0 0 0 1;
        K_3 0 0 0 0 0];

B_se = [0 0;
        0 K_1;
        0 0;
        K_2 0;
        0 0;
        0 0];
 
C_se = [1 0 0 0 0 0;
        0 0 1 0 0 0;
        0 0 0 0 1 0];

% Observability
Ob = obsv(A_se,C_se);
disp(['5.4.2: Rank of observability matrix: ', num2str(rank(Ob))]);

%%% Closed-loop observer - Controller without integral effect
eigs_controller = eig(A-B*K);

% Use fastest pole as starting point
[~, index] = max(abs(eigs_controller));
min_eig = -abs(eigs_controller(index));
spacing = 0.15; % Spacing between the poles
eigs_gain_factor = 20; % How much each pole is scaled
eigs_estimator = 1:spacing:(1 + spacing*(size(A_se) - 1));
eigs_estimator = eigs_estimator * min_eig * eigs_gain_factor;

% Place poles as desired (Make C_se complex equivalent)
L = place(A_se', (C_se)', eigs_estimator)';

%% Generate plots
%genPlotFile('P4p2', 'Pitch estimate', 'Pitch [rad]', t, pitch(:,1), pitch(:,2), 'Estimated');
%genPlotFile('P4p2', 'Pitch rate estimate', 'Pitch rate [rad/s]', t, pitch_rate(:,1), pitch_rate(:,2), 'Estimated');
%genPlotFile('P4p2', 'Elevation estimate', 'Elevation [rad]', t, elevation(:,1), elevation(:,2), 'Estimated');
%genPlotFile('P4p2', 'Elevation rate estimate', 'Elevation rate [rad/s]', t, elevation_rate(:,1), elevation_rate(:,2), 'Estimated');
%genPlotFile('P4p2', 'Travel estimate', 'Travel [rad]', t, travel(:,1), travel(:,2), 'Estimated');
%genPlotFile('P4p2', 'Travel rate estimate', 'Travel rate [rad/s]', t, travel_rate(:,1), travel_rate(:,2), 'Estimated');
