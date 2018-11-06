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

%% 5.2 a)
load('wave.mat');

fs = 10; % From assigment
window = 4096; % From assigment

t = psi_w(1,:);
x = psi_w(2,:);

[pxx,f] = pwelch(x, window, [], [], fs);

% Convert to radians
w = 2*pi*f;
pxx_radians = pxx / (2*pi);

%% 5.2 b)
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
        w, pxx_radians);
        %[],[],...
        %options);

lambda = x(1); % Get value from least square fit
K_w = 2*lambda*w_0*sigma; % Update K_w with correct value