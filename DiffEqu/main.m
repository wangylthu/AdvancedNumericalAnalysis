clear;

n = 4;
inter = 1;
grid = [0:inter/(n-1):inter];
p = -ones(n, 1);
q = pi^2*ones(n, 1);
f = 4*pi^2*ones(n, 1);

[A, b] = Variational(p, q, f, n, inter/(n-1));
A_hat = A(2:end-1,2:end-1);
b_hat = b(2:end-1) - 4 * A(2:end-1,end);
u_hat = A_hat \ b_hat;
u = [0;u_hat;4];
plot(grid, u);