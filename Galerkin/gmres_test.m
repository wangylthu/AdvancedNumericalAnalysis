clear;

n = 100;
A = 10+rand(n);
m = 10;
x_star = rand(n, 1);
b = A * x_star;
x0 = randn(n, 1);
max_iter = 1000;
eps = 1e-6;
[x, err] = GMRES_m(b, A, x0, m, max_iter, eps);