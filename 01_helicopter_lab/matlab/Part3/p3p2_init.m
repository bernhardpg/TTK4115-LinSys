run('Common/constants.m');

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

q_1 = 200; % Pitch
q_2 = 30; % Pitch rate
q_3 = 200; % Elevation rate
r_1 = 0.5; % V_s
r_2 = 1; % V_d

Q = [q_1 0 0;
     0 q_2 0;
     0 0 q_3];
 
R = [r_1 0;
     0 r_2];

K = lqr(A, B, Q, R);
P = inv(C*inv(B*K - A)*B);