clear;

m = 100;
d = rand(m,1);
D = diag(d);
[Q, ~] = qr(randn(m));
A = Q * D * Q';
max_iter = 1000;
Z0 = eye(m);

[Q1, d1] = OI(A, Z0, max_iter);
[Q2, d2] = QR_plain(A, max_iter);
[Q3, d3] = QR_implicit(A, max_iter);