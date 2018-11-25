%% Part 5.3 a)
run('../part_5_1/p5p1d.m');

T_d = T;
T_f = 8.4;
w_c = 0.1;
K_pd = sqrt(w_c ^2 + (T_f * w_c^2)^2) / K;
phase_margin = 50;
H_pd = K_pd * tf([T_d 1],...
                 [T_f, 1]);
H_ol = H_pd * H_ship; 