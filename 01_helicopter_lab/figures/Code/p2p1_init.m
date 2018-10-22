%% Problem 2.1

% Joystick gains
Joystick_gain_x = 0.8;
Joystick_gain_y = -0.8;

% Controller Parameters (from problem description)
e_c = 0;
K_ei = 5;
K_ep = 15;
K_ed = 12;

K_pp = 7.5;
K_pd = 2*sqrt(K_pp/K_1);