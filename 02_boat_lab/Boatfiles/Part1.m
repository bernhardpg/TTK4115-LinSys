%% 5.1 a)

K = 2;
T = 3;
A = [0 0 0 0 0;
     0 0 0 0 0;
     0 0 0 1 0;
     0 0 0 -1/T -K/T;
     0 0 0 0 0];
B = [0 0 0 K/T 0]';

C = [0 0 1 0 0];

D = 0;

[num, den] = ss2tf(A, B, C, D);

%% 5.1 b)

h1_amp = 29.3575; % From plot measurement
h2_amp = 0.8315; % From plot measurement

w1 = 0.005;
w2 = 0.05;

syms K_ T_
eqs = [
    h1_amp == K_/sqrt(T_^2*w1^4 + w1^2),
    h2_amp == K_/sqrt(T_^2*w2^4 + w2^2)
    ];

[solK, solT] = solve(eqs, [K_ T_]);
solK = double(solK);
solT = double(solT);

K = solK(1);
T = solT(2);

%TODO: PLOT

%% 5.1 c)

h1_noise = (63.48 - 3.915)/2; % Ok to measure, slighlt affected
h2_noise = (5.371 - 1.979)/2; % Bad estimate, very noisy sine wave

eqs = [
    h1_noise == K_/sqrt(T_^2*w1^4 + w1^2),
    h2_noise == K_/sqrt(T_^2*w2^4 + w2^2)
    ];

[solK, solT] = solve(eqs, [K_ T_]);
solK = double(solK);
solT = double(solT);

K2 = solK(1)
T2 = solT(2)


%TODO: PLOT

%% 5.1 d)

transfer_func = tf(K, [T 1 0]);
step(transfer_func, 1000);
% Looks about right compared to the actuall system.
% TODO: graph linearized model in same plot as actual model 

