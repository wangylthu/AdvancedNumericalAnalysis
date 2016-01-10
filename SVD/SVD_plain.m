function [U, D, V] = SVD_plain(A, max_iter, eps)
    [B, Q, W] = UpDoubDiag(A);
    GR = eye(size(A, 2));
    Bk = B;
    for k = 1:max_iter
        [Bk, gr] = BulgeChasing(Bk);
        GR = GR * gr;
    end
    d = diag(Bk);
    d(abs(d) < eps) = 0;
    D = zeros(size(A));
    D(1:length(d), 1:length(d)) = diag(d);
    U = W * GR;
    V = Q * B * U / D;
end

function [B, Q, W] = UpDoubDiag(A)
    [m, n] = size(A);
    Q = zeros(m);
    W = zeros(n);
    B = zeros(m, n);
    w = zeros(n, 1);
    w(1) = 1;
    W(:,1) = w;
    q = A * w;
    B(1,1) = norm(q);
    Q(:,1) = q / norm(q);
    for k = 2:n
        res_w = Q(:,k-1)' * A - B(k,k) * W(:,k-1)';
        B(k-1, k) = norm(res_w);
        W(:,k) = res_w' / norm(res_w);
        
        res_q = A * W(:,k) - B(k-1, k) * Q(:,k-1);
        B(k, k) = norm(res_q);
        Q(:,k) = res_q / norm(res_q);
    end
end

function [B, gr] = BulgeChasing(B)
    return
end
        