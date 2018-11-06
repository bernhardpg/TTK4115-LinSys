clc; clear all; close all;
run('Constants.m');
close all;

%% Part 5.4 a)

A = [0 1 0 0 0;
    -w_0^2 -2*lambda*w_0 0 0 0;
     0 0 0 1 0;
     0 0 0 -1/T -K/T;
     0 0 0 0 0];

B = [0 0 0 K/T 0]';

C = [0 1 1 0 0];

E = [0 0;
     K_w 0;
     0 0;
     0 0;
     0 1];

%% Part 5.4 b)
A_no_dist = [0 1;
             0 -1/T];
         
C_no_dist = [1 0];
ob_no_dist = obsv(A_no_dist,C_no_dist);
obs_no_dist = (rank(ob_no_dist) == size(A_no_dist,1));
fprintf('System is observable without disturbances: %d\n', obs_no_dist);

%% Part 5.4 c)
A_curr_dist = [0 1 0;
               0 -1/T -K/T;
               0 0 0];
           
C_curr_dist = [1 0 0];
ob_curr_dist = obsv(A_curr_dist,C_curr_dist);
obs_curr_dist = (rank(ob_curr_dist) == size(A_curr_dist,1));
fprintf('System is observable with current disturbance: %d\n', obs_curr_dist);

%% Part 5.4 d)
A_wave_dist = [0 1 0 0;
               -w_0^2 -2*lambda*w_0 0 0;
               0 0 0 1
               0 0 0 -1/T];
           
C_wave_dist = [0 1 1 0];
ob_wave_dist = obsv(A_wave_dist,C_wave_dist);
obs_wave_dist = (rank(ob_wave_dist) == size(A_wave_dist,1));
fprintf('System is observable with wave disturbance: %d\n', obs_wave_dist);

%% Part 5.4 e)
ob = obsv(A, C);
obs = (rank(ob) == size(A, 1));
fprintf('System is observable with all disturbances: %d\n', obs);
