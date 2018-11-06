%% 5.2 a)
close all;
load('../Common/wave.mat');

fs = 10; % From assigment
window = 4096; % From assigment

t = psi_w(1,:);
x = psi_w(2,:);

[pxx,f] = pwelch(x, window, [], [], fs);

% Convert to radians
w = 2*pi*f;
pxx_radians = pxx / (2*pi);

% Plot of noise signal
genPlotFile('Part_5_2_a', 'Wave disturbance', 'Time [s]', 'Disturbance [deg]', t, x, [], '$\psi_{\omega}$', '')
%genPlotFile(prefix, titleString, xLabel, yLabel, xArray, plot1, plot2, plot1Legend, plot2Legend)

% Plot of PSD function
signal_cutoff = 135;

% Is this unneccesary?
%genPlotFile('Part_5_2_a', 'PSD estimate of the wave disturbance', 'Frequency [rad/s]', 'Power [power s/rad]', w(1:signal_cutoff), pxx_radians(1:signal_cutoff), [], '$S_{\psi_{\omega}}(\omega)$', '');

%% 5.2 d)
w_0 = 0.7823; % From plot measurement (peak freq)
A = 1; % Unity variance white noise
sigma_squared = 2.6; % From plot measurement (peak value)
sigma = sqrt(sigma_squared);
lambda = 1; % Initial trial value for lsqcurvefit

fun = @(x, w)((2*x*w_0*sigma)^2 * w.^2) ./ ((w_0^2 - w.^2).^2 + (2*x(1)*w_0*w).^2);

%options = optimoptions('lsqcurvefit','Display', 'iter'); 
x = lsqcurvefit(...
        fun,...
        lambda,...
        w, pxx_radians,...
        [],[],...
        options);

lambda = x(1); % Get value from least square fit
fprintf("Lambda from lsq curve fit algorithm: %f", lambda);
K_w = 2*lambda*w_0*sigma; % Update K_w with correct value

P_phi_w = (K_w^2 * w.^2) ./ ((w_0^2 - w.^2).^2 + (2*lambda*w_0*w).^2);

% Only plot the 135 first values
signal_cutoff = 135;
%TODO: Fit curve with cutoff signal?

genPlotFile('Part_5_2_d', 'Power Spectral Density function', 'Frequency [rad/s]', 'Power [power s/rad]', w(1:signal_cutoff), pxx_radians(1:signal_cutoff), P_phi_w(1:signal_cutoff), '$S_{\psi_{\omega}}(\omega)$ (Estimated function)', '$P_{\psi_{\omega}}(\omega)$ (Curve fitted function)')