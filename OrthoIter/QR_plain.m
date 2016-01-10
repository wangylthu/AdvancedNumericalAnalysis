function [Q, d] = QR_plain(A, max_iter)
    for k = 1:max_iter
        [Q, R] = qr(A);
        A = R * Q;
    end
    d = diag(R);
end