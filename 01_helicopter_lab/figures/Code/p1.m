%% Problem 1

%% TIME
t = 0:0.002:9.9;

% Joystick gains
Joystick_gain_x = 0.8;
Joystick_gain_y = -0.8;

%%%%%%%%%%% Measured constants
E_OFF = 29.2; % Elevation encoder offset
P_OFF = 5.5; % Pitch offset
V_star = 6.5; % Requiered equibalirium voltage

%%%%%%%%%%% Physical constants
g = 9.81; % gravitational constant [m/s^2]
l_c = 0.46; % distance elevation axis to counterweight [m]
l_h = 0.66; % distance elevation axis to helicopter head [m]
l_p = 0.175; % distance pitch axis to motor [m]
m_c = 1.92; % Counterweight mass [kg]
m_p = 0.72; % Motor mass [kg]

% From 5.1.4
K_f = (2*m_p*g*l_h - m_c*g*l_c)/(l_h*V_star); 

% From 5.1.1
L_1 = K_f*l_p;
L_2 = m_c*g*l_c - 2*m_p*g*l_h;
L_3 = K_f*l_h;
L_4 = K_f*l_h;

% From 5.1.2
J_p = 2*m_p*l_p*l_p;
J_e = m_c*l_c*l_c + 2*m_p*l_h*l_h;
J_lambda = m_c*l_c*l_c + 2*m_p*(l_h*l_h + l_p*l_p);

K_1 = L_1/J_p;
K_2 = L_3/J_e;
K_3 = (L_2*L_4) / (L_3*J_lambda);