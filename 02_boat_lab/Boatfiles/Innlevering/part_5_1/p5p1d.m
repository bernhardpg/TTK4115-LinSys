%% 5.1 d)
run('p5p1b.m');

H_ship = tf(K, [T 1 0]);

%% Plot
%{


sim('p5p1dx.mdl');

%Small hack to make step work
ignore_first = 10;
time = p5p1d_compass.time(ignore_first:end);
data = p5p1d_compass.data(ignore_first:end);

[step_response,~] = step(H_ship, time);
genPlotFile('p5p1d','Step Response','Time [s]', 'Heading [degrees]', time, data, step_response, 'Ship heading $\psi$', 'Model heading $\psi$');
% Looks about right compared to the actuall system.
% TODO: graph linearized model in same plot as actual model 
%}