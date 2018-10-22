%% Problem 3.1
A = [0 1 0;
     0 0 0;
     0 0 0];
    
B = [0 0;
     0 K_1;
     K_2 0];
    
C = [1 0 0;
     0 0 1];

 %% Problem 3.2 - Controllability and LQR of the system
Co = ctrb(A, B);

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