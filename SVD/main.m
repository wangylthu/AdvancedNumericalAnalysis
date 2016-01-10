clear;

m = 100;
n = 80;
A = randn(m, n);
[u, d, v] = svd(A, 'econ');

max_iter = 1000;
eps = 1e-4;

[U1, D1, V1] = SVD_plain(A, max_iter, eps);