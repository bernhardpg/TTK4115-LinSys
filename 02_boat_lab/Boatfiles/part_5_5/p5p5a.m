%% Part 5.5 a)
clc; clear all;
run('../part_5_3/p5p3a.m')
run('../part_5_2/p5p2.m')
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

T_s = 0.1; % seconds (10 Hz)

[~, B_d] = c2d(A, B, T_s);
[A_d, E_d] = c2d(A, E, T_s);