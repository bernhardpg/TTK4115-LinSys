open('P4p2_integral_Elevation_rate_estimate.fig');
a = get(gca,'Children');
ydata = get(a, 'YData');
elevation_rate = ydata{1,1}
elevation_rate_ref = ydata{2,1}


open('P4p2_integral_Pitch_rate_estimate.fig');
a = get(gca,'Children');
ydata = get(a, 'YData');
pitch_rate = ydata{1,1}
pitch_rate_ref = ydata{2,1}



t = 0:0.002:9.9;

%% Generate plots
%genPlotFile('P4p2_integral', 'Pitch estimate', 'Pitch [rad]', t, pitch(:,1), pitch(:,2), 'Estimated');
genPlotFile('P4p2_integral', 'Pitch rate estimate', 'Pitch rate [rad/s]', t(50:end), pitch_rate_ref(50:end), pitch_rate(50:end), 'Estimated');
%genPlotFile('P4p2_integral', 'Elevation estimate', 'Elevation [rad]', t, elevation(:,1), elevation(:,2), 'Estimated');
genPlotFile('P4p2_integral', 'Elevation rate estimate', 'Elevation rate [rad/s]', t(50:end), elevation_rate_ref(50:end), elevation_rate(50:end), 'Estimated');
%genPlotFile('P4p2_integral', 'Travel estimate', 'Travel [rad]', t, travel(:,1), travel(:,2), 'Estimated');
%genPlotFile('P4p2_integral', 'Travel rate estimate', 'Travel rate [rad/s]', t, travel_rate(:,1), travel_rate(:,2), 'Estimated');