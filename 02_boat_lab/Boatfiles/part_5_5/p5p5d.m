%% Part 5.5 d)
run('p5p5c.m');
psi_r = 30;
sim('p5p5dx');



%{
%genPlotFile(prefix, titleString, xLabel, yLabel, xArray, plot1, plot2, plot1Legend, plot2Legend)

genPlotFile('Part_5_5_d', 'Measured compass course (with bias estimate feed forward)', 'time [s]', ...
    'Heading [deg]', psi_measured.time, psi_r_vector.data, psi_measured.data,...
    '$\psi_r$ (Reference)', '$\psi$ (Measured compass course)');


genPlotFile('Part_5_5_d', 'Estimated bias and rudder input', 'time [s]', ...
    'Rudder angle [deg]', b_hat.time, b_hat.data, delta.data, ...
    '$\hat{b}$ (Estimated bias)', '${u}$ (Rudder input)');



 Comments: The Kalman filter estimates the bias, which is then feed
 forwarded. Given a perfect bias estimate, this is equivalent to not having
 a bias at all. It is clear that the bias is the reason for the constant
 error seen in 5.3 c), and that a good estimate for the bias in addition to
 a feed forward compensates for this constant error.

%}