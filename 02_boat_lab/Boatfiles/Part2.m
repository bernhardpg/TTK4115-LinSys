%% 2a
close all
load('wave.mat')

fs = 10;
window = 4096;

t = psi_w(1,:);
x = psi_w(2,:);

%[pxx,f] = pwelch(x,window, 0, 100005 ,fs);
[pxx,f] = pwelch(x,window, [], [] ,fs);

figure(1)
plot(t,x)

figure(2)
plot(f,pxx)
close all;
figure(3)
plot(f * (2*pi), 10*log10(pxx / (2*pi))) % ? Power ratio in dB: 10^1/10
xlabel('Frequency (rad/s)');
ylabel('PSD (dB/rad)');
%TODO is this correct?

%% 2b
w_0 = 0.7823;
w = 1:0.01:32;
T = 10000;
lambda = 1;
sigma_squared = 10^(4.149/10);
sigma = sqrt(sigma_squared)*10*10;
K_w = 2*lambda*w_0*sigma;
%fun = @(x, w)(K_w^2 * w.^2 / T) ./ ((w_0^2 - w.^2).^2 + (2*x(1)*w_0*w).^2);
%x = lsqcurvefit(fun, [lambda], f*(2*pi), 10*log10(pxx / (2*pi)))

lambda = 1
K_w = 2*lambda*w_0*sigma;

P_phi_w = (K_w^2 * w.^2 / T) ./ ((w_0^2 - w.^2).^2 + (2*lambda*w_0*w).^2);



figure(4)
plot(w, 10*log10(P_phi_w))