%% Part 5.3 b)
run('p5p3a.m');
psi_r = 30;
sim('p5p3bx.mdl');
n_values = size(p5p3_measured_compass.time,1);
ref = ones(n_values, 1)*psi_r;

%(prefix, titleString, xLabel, yLabel, xArray, plot1, plot2, plot1Legend, plot2Legend)
genPlotFile('p5p3b', 'Compass Course - No Disturbances', 'Time [s]',...
            'Heading [degrees]', p5p3_measured_compass.time,...
            ref, p5p3_measured_compass.data,...
            'Reference $\psi_r$', 'Heading $\psi$');
        
%(prefix, titleString, xLabel, yLabel, xArray, plot1, plot1Legend)
genPlotFileSingle('p5p3b', 'Rudder Input - No Disturbances', 'Time [s]',...
            'Rudder angle [degrees]', p5p3_rudder_input.time,...
            p5p3_rudder_input.data, 'Rudder input $\delta$');