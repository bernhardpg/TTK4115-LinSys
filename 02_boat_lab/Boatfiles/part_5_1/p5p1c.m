%% 5.1 c)

h1_noise = (63.48 - 3.915)/2; % Ok to measure, slighlt affected
h2_noise = (5.371 - 1.979)/2; % Bad estimate, very noisy sine wave

sine_freq = 0.05;
%% Plot
%{
sim('p5p1cx.mdl');
% (prefix, titleString, xLabel, yLabel, xArray, plot1, plot1Legend)
genPlotFileSingle('p5p1c 0,05', 'Compass Course', 'Time [s]', 'Heading [degrees]',...
    p5p1c_compass.time, p5p1c_compass.data, 'Heading $\psi$')
%}