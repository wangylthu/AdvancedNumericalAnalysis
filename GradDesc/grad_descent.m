clear;
m = 100;
randseed();

A = randn(m);
[q, ~] = qr(A);
D = diag(rand(m, 1));
A = q * D * q';

x_star = rand(m, 1);
b = A * x_star;

x0 = zeros(m, 1);
max_iter = 1000;
eps = 1e-6;

[x1, err1] = SGD(b, A, x0, max_iter, eps);
[x2, err2] = CG(b, A, x0, max_iter, eps);
D_A = diag(diag(A));
L_A = tril(A);
U_A = triu(A);
M_inv = (D_A + U_A) \ D_A /(D_A + L_A);
[x3, err3] = CG_gsp(b, A, x0, M_inv, max_iter, eps);

