m = 100;
D = randn(m, 1);
L = rand(m-1, 1);
A = diag(D) + diag(L, -1) + diag(L, 1);
lambda = Strum(A, 0, 1, 1e-6);

n = 64;
T = A(1:64, 1:64);
[Q, a] = DC_eigs(T, n);