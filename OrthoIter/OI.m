function [Q, d] = OI(A, Z0, max_iter)
    Q = Z0;
    for k = 1:max_iter
        Y = A * Q;
        [Q, R] = qr(Y);
    end
    d = diag(R);
end