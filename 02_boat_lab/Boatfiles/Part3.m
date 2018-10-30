clc; clear all;
run('Part1.m');

%% Part 5.3 a)

T_d = T;
T_f = 8.4;
w_c = 0.1;
K_pd = sqrt(w_c ^2 + (T_f * w_c^2)^2) / K;
phase_margin = 50;
H_pd = K_pd * tf([T_d 1],...
                 [T_f, 1])
H_ol = H_pd * H_ship; 
margin(H_ol) 

%% Part 5.3 b)
psi_r = 30; 


% The autopilot works
% Advantage with PD over P controller:
% The differentiation effect of the PD controller raises the phase margins,
% allowing for quicker control while maintaining a stable system with the
% decired w_c and phase margin.

% PLOT Rudder input vs. compass course! See assignment

%% Part 5.3 c)
% No, we can a stationary offset. This is because zero input does not give
% zero error. Need integral effect <3

%% Part 5.4 d)
% The compass shows that the boat is heading in the right direction, but
% the waves are knocking the boat off course with about +/- 2 degrees every 2
% seconds