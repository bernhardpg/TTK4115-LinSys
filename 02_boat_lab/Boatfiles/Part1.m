K = 2;
T = 3;
A = [0 0 0 0 0;
     0 0 0 0 0;
     0 0 0 1 0;
     0 0 0 -1/T -K/T;
     0 0 0 0 0];
B = [0 0 0 K/T 0]';

C = [0 0 1 0 0];

D = 0;

[num, den] = ss2tf(A, B, C, D);

h1 = 29.3575;
h2 = 8.315;
w1 = 0.005;
w2 = 0.05;

syms K_ T_
eqs = [
    h1 == K_/sqrt(T_^2*w1^4 + w1^2),
    h2 == K_/sqrt(T_^2*w2^4 + w2^2)
    ];

[solK, solT] = solve(eqs, [K_ T_]);
solK = double(solK);
solT = double(solT);

K = solK(1);
T = solT(2);
