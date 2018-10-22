%% Problem 3.3 - LQR with integral effect

V_star = 10;
Joystick_gain_x = Joystick_gain_x * 0.5;

% Augmented system
A_bar = [ 0 1 0 0 0;
        0 0 0 0 0;
        0 0 0 0 0;
        1 0 0 0 0;
        0 0 1 0 0 ];

B_bar = [ 0 0;
        0 K_1;
        K_2 0;
        0 0;
        0 0 ];
    
C_bar = [ 1 0 0 0 0;
        0 0 1 0 0 ];


% Costs for LQR with integral effect
q_1 = 30; % Pitch
q_2 = 30; % Pitch rate
q_3 = 30; % Elevation rate
q_4 = 20; % Pitch integral
q_5 = 40; % Elevation integral
r_1 = 1; % V_s
r_2 = 1; % V_d
    
Q_bar = [ q_1 0 0 0 0;
          0 q_2 0 0 0;
          0 0 q_3 0 0;
          0 0 0 q_4 0;
          0 0 0 0 q_5 ];

R = [r_1 0;
     0 r_2];


% LQR gain with integral effect
K_bar = lqr(A_bar, B_bar, Q_bar, R);

K = K_bar([1 2], [1 2 3]);

% Reference feed forward
P = inv(C*inv(B*K - A)*B);