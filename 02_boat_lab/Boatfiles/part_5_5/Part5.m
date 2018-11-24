clc; clear all; close all;
run('Part3.m');
run('Constants.m');
close all;

%% Part 5.5 a)

% Continous state space model from 5.4 a)
A = [0 1 0 0 0;
    -w_0^2 -2*lambda*w_0 0 0 0;
     0 0 0 1 0;
     0 0 0 -1/T_s -K/T_s;
     0 0 0 0 0];

B = [0 0 0 K/T_s 0]';

C = [0 1 1 0 0];

D = 0;

E = [0 0;
     K_w 0;
     0 0;
     0 0;
     0 1];
 
 
 % Only discretize A, B and E
C_d = C;
D_d = D;

T_s = 0.1; % seconds (10 Hz)

[~, B_d] = c2d(A, B, T_s);
[A_d, E_d] = c2d(A, E, T_s);

%% Part 5.5 b)

%load_system('task5_5_b');
sim('task5_5_b');
R_sigma_squared = var(v_measurement.data); % [degrees^2]
R = R_sigma_squared / T_s;


%% Part 5.5 c)
P_0_apriori = diag([1 0.013 pi^2 1 2.5*10^(-3)]);
 
x_hat_0_apriori = [0 0 0 0 0]';
 
Q = diag([30 10^(-6)]);

% Create struct for Kalman function
system = struct('A_d', A_d, 'B_d', B_d, 'C_d', C_d, 'E_d', E_d, ...
    'P_0_apriori', P_0_apriori, 'x_hat_0_apriori', x_hat_0_apriori, ...
    'R', R, 'Q', Q);

%% Part 5.5 d)
sim('task5_5_d');

psi_r = 30;

%genPlotFile(prefix, titleString, xLabel, yLabel, xArray, plot1, plot2, plot1Legend, plot2Legend)

genPlotFile('Part_5_5_d', 'Measured compass course (with bias estimate feed forward)', 'time [s]', ...
    'Heading [deg]', psi_measured.time, psi_r_vector.data, psi_measured.data,...
    '$\psi_r$ (Reference)', '$\psi$ (Measured compass course)');


genPlotFile('Part_5_5_d', 'Estimated bias and rudder input', 'time [s]', ...
    'Rudder angle [deg]', b_hat.time, b_hat.data, delta.data, ...
    '$\hat{b}$ (Estimated bias)', '${u}$ (Rudder input)');


%{
 Comments: The Kalman filter estimates the bias, which is then feed
 forwarded. Given a perfect bias estimate, this is equivalent to not having
 a bias at all. It is clear that the bias is the reason for the constant
 error seen in 5.3 c), and that a good estimate for the bias in addition to
 a feed forward compensates for this constant error.

%}

%% Part 5.5 e)

sim('task5_5_e');

genPlotFile('Part_5_5_e', 'Measured compass course (with bias estimate feed forward and wave filtering)', 'time [s]', ...
    'Heading [deg]', psi_measured.time, psi_measured.data, psi_hat.data, ...
    '$\psi$ (Measured compass course)', '$\hat{\psi}$ (Estimated compass course)');

genPlotFile('Part_5_5_e', 'Estimated bias and rudder input', 'time [s]', ...
    'Rudder angle [deg]', b_hat.time, b_hat.data, delta.data, ...
    '$\hat{b}$ (Estimated bias)', '${u}$ (Rudder input)');

genPlotFile('Part_5_5_e', 'Wave influence', 'time [s]', ...
    'Heading [deg]', psi_w_hat.time, psi_w.data, psi_w_hat.data, ...
    '$\psi_w$ (Wave influence)', '$\hat{\psi}_w$ (Estimated wave influence)');