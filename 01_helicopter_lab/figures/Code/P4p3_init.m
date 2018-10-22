%% Problem 4.3

% y without pitch
C_se_no_pitch = [0 0 1 0 0 0;
                 0 0 0 0 1 0];

% y without travel    
C_se_no_travel = [1 0 0 0 0 0;
                  0 0 1 0 0 0];

% Calculate observability
Ob_no_pitch = obsv(A_se, C_se_no_pitch);
Ob_no_travel = obsv(A_se, C_se_no_travel);

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
