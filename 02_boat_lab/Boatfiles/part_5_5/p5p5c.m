%% Part 5.5 c)
P_0_apriori = diag([1 0.013 pi^2 1 2.5*10^(-3)]);
 
x_hat_0_apriori = [0 0 0 0 0]';
 
Q = diag([30 10^(-6)]);

% Create struct for Kalman function
system = struct('A_d', A_d, 'B_d', B_d, 'C_d', C_d, 'E_d', E_d, ...
    'P_0_apriori', P_0_apriori, 'x_hat_0_apriori', x_hat_0_apriori, ...
    'R', R, 'Q', Q);