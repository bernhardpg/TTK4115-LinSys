%% Part 5f

% Compare different Q matrices for 5.5 e)
%{
run('../part_5_5/p5p5e.m');

system.Q = system.Q * 10000;

sim('p5p5ex');

genPlotFile('Part_5_5_f', 'Measured compass course with increased Q', 'time [s]', ...
    'Heading [deg]', psi_measured.time, psi_measured.data, psi_hat.data, ...
    '$\psi$ (Measured compass course)', '$\hat{\psi}$ (Estimated compass course)');

genPlotFile('Part_5_5_f', 'Estimated bias and rudder input with increased Q', 'time [s]', ...
    'Rudder angle [deg]', b_hat.time, b_hat.data, delta.data, ...
    '$\hat{b}$ (Estimated bias)', '${u}$ (Rudder input)');

genPlotFile('Part_5_5_f', 'Wave influence with increased Q', 'time [s]', ...
    'Heading [deg]', psi_w_hat.time, psi_w.data, psi_w_hat.data, ...
    '$\psi_w$ (Wave influence)', '$\hat{\psi}_w$ (Estimated wave influence)');

system.Q = system.Q / (10000 * 10000);

sim('p5p5ex');

genPlotFile('Part_5_5_f', 'Measured compass course with reduced Q', 'time [s]', ...
    'Heading [deg]', psi_measured.time, psi_measured.data, psi_hat.data, ...
    '$\psi$ (Measured compass course)', '$\hat{\psi}$ (Estimated compass course)');

genPlotFile('Part_5_5_f', 'Estimated bias and rudder input with reduced Q', 'time [s]', ...
    'Rudder angle [deg]', b_hat.time, b_hat.data, delta.data, ...
    '$\hat{b}$ (Estimated bias)', '${u}$ (Rudder input)');

genPlotFile('Part_5_5_f', 'Wave influence with reduced Q', 'time [s]', ...
    'Heading [deg]', psi_w_hat.time, psi_w.data, psi_w_hat.data, ...
    '$\psi_w$ (Wave influence)', '$\hat{\psi}_w$ (Estimated wave influence)');

%}

% Compare different Q matrices for 5.5 e)

run('../part_5_5/p5p5d.m');

system.Q = system.Q * 10000;

sim('p5p5dx');

genPlotFile('Part_5_5_f', 'Measured compass course with increased Q', 'time [s]', ...
    'Heading [deg]', psi_measured.time, psi_r_vector.data, psi_measured.data, ...
    '$\psi_r$ (Reference)', '$\hat{\psi}$ (Estimated compass course)');

genPlotFile('Part_5_5_f', 'Estimated bias and rudder input with increased Q', 'time [s]', ...
    'Rudder angle [deg]', b_hat.time, b_hat.data, delta.data, ...
    '$\hat{b}$ (Estimated bias)', '${u}$ (Rudder input)');


system.Q = system.Q / (10000 * 10000);

sim('p5p5dx');

genPlotFile('Part_5_5_f', 'Measured compass course with reduced Q', 'time [s]', ...
    'Heading [deg]', psi_measured.time, psi_r_vector.data, psi_measured.data, ...
    '$\psi$ (Measured compass course)', '$\hat{\psi}$ (Estimated compass course)');

genPlotFile('Part_5_5_f', 'Estimated bias and rudder input with reduced Q', 'time [s]', ...
    'Rudder angle [deg]', b_hat.time, b_hat.data, delta.data, ...
    '$\hat{b}$ (Estimated bias)', '${u}$ (Rudder input)');

