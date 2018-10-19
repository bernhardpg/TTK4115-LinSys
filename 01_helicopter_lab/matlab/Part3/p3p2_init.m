run('../Common/constants.m');

% Joystick gains
Joystick_gain_x = 1;
Joystick_gain_y = -0.9;

A = [0 1 0;
     0 0 0;
     0 0 0];
    
B = [0 0;
     0 K_1;
     K_2 0];
    
C = [1 0 0;
     0 0 1];

 %% 5.3.2 - Controllability and LQR of the system
Co = ctrb(A, B);
disp(['5.3.2: Rank of controllability matrix: ', num2str(rank(Co))]);

q_1 = 60; % Pitch
q_2 = 10; % Pitch rate
q_3 = 80; % Elevation rate
r_1 = 1; % V_s
r_2 = 1; % V_d

Q = [q_1 0 0;
     0 q_2 0;
     0 0 q_3];
 
R = [r_1 0;
     0 r_2];

K = lqr(A, B, Q, R);
P = inv(C*inv(B*K - A)*B);

%% Generate plots
% genPlotFile(titleString, yString, t, reference, state, stateLegend)
%genPlotFile('P3p2', 'Elevation LQR', 'Elevation [rad]', t, elevation(:,1), elevation(:,2), 'Measured elevation');
%genPlotFile('P3p2', 'Elevation rate LQR', 'Elevation rate [rad/s]', t, elevation_rate(:,1), elevation_rate(:,2), 'Measured elevation rate');
%genPlotFile('P3p2','Pitch LQR', 'Pitch [rad]', t, pitch(:,1), pitch(:,2), 'Measured pitch');