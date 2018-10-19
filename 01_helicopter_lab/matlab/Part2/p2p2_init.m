run('p2p1_init.m');

K_pp = 5;
K_pd = 2*sqrt(K_pp/K_1);

K_rp = -1.5;
rho = K_3*K_rp;

Joystick_gain_x = 0.5;

%% Generate plots
% genPlotFile(titleString, yString, t, reference, state, stateLegend)
genPlotFile('P2p2', 'Elevation angle', 'Pitch [rad]', t, elevation(:,1), elevation(:,2), 'Measured elevation');
genPlotFile('P2p2', 'Travel P', 'Travel [rad]', t, travel(:,1), travel(:,2), 'Measured travel');
genPlotFile('P2p2', 'Travel rate P', 'Travel rate [rad/s]', t, travel_rate(:,1), travel_rate(:,2), 'Measured travel rate');