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

%{
%% Plot
sine_freq = w1;
sim('p5p1bx.mdl');
% (prefix, titleString, xLabel, yLabel, xArray, plot1, plot1Legend)
genPlotFileSingle('p5p1b 0,005', 'Compass Course', 'Time [s]', 'Heading [degrees]',...
    p5p1a_compass.time, p5p1a_compass.data, 'Heading $\psi$')

sine_freq = w2;
sim('p5p1bx.mdl');
% (prefix, titleString, xLabel, yLabel, xArray, plot1, plot1Legend)
genPlotFileSingle('p5p1b 0,05', 'Compass Course', 'Time [s]', 'Heading [degrees]',...
    p5p1a_compass.time, p5p1a_compass.data, 'Heading $\psi$')
              
%}