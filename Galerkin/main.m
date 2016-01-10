clear;

m = 100;
A = randn(m);
b = rand(m, 1);
[Q1, H1] = Arnoldi(A, b);

L = tril(A);
A = L + L';
[Q2, H2] = Lanczos(A, b);