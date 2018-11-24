clc; clear all; close all;
run('Constants.m');
close all;

%% Part 5.5 a)

% Continous state space model from 5.4 a)
A = [0 1 0 0 0;
    -w_0^2 -2*lambda*w_0 0 0 0;
     0 0 0 1 0;
     0 0 0 -1/T -K/T;
     0 0 0 0 0];

B = [0 0 0 K/T 0]';

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

T = 0.1; % seconds (10 Hz)

[A_d, B_d] = c2d(A, B, T);
[A_d, E_d] = c2d(A, B, T);

%% Part 5.5 b)

%load_system('task5_5_b');
sim('task5_5_b');
R_sigma_squared = var(v_measurement.data) % [rad^2]
R = R_sigma_squared / T;


%% Part 5.5 c)
P_0_minus = diag([1 0.013 pi^2 1 2.5*10^(-3)]);
 
x_hat_0_minus = [0 0 0 0 0]';
 
Q = diag([30 10^(-6)]);

