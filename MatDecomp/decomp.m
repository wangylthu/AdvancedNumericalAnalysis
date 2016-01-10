clear;

m = 100;
A = rand(100);
[L1, U1] = LU(A);

D = diag(rand(m, 1));
[Q, ~] = qr(randn(m));
A = Q * D * Q';
L2 = Cholesky(A);
