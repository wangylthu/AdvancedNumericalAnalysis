clear;

m = 100;
D = diag(rand(100,1));
[Q, ~] = qr(randn(100));
A = Q * D * Q';
l = tril(A, -2);
M = A - l - l';
max_iter = 10000;
eps = 1e-6;

[d, L] = LR(M, max_iter, eps);