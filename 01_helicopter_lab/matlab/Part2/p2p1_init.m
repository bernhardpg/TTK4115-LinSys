run('../Common/constants.m');

% Joystick gains
Joystick_gain_x = 0.8;
Joystick_gain_y = -0.8;

% Controller Parameters (from problem description)
e_c = 0;
K_ei = 5;
K_ep = 15;
K_ed = 12;

K_pp = 7.5;
K_pd = 2*sqrt(K_pp/K_1);

%% Generate plots
% genPlotFile(titleString, yString, t, reference, state, stateLegend)
%genPlotFile('P2p1', 'Elevation angle', 'Pitch [rad]', t, elevation(:,1), elevation(:,2), 'Measured elevation');
%genPlotFile('P2p1', 'Pitch angle PD', 'Pitch [rad]', t, pitch(:,1), pitch(:,2), 'Measured pitch');