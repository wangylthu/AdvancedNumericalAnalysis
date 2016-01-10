function [Q, d] = QR_implicit(A, max_iter)
    [H, Q] = Householder(A);
    n = size(H, 1);
    for k = 1:max_iter
        q1 = givens(H(1,1), H(2,1));
        for j = 1:n-2
            H(j:j+1,:) = q1 * H(j:j+1,:);
            H(:,j:j+1) = H(:,j:j+1) * q1';
            
            Q(j:j+1,:) = q1 * Q(j:j+1,:);
            
            q1 = givens(H(j+1,j), H(j+2,j));
        end
    end
    d = diag(H);
end

function [H, Q] = Householder(A)
    n = size(A, 1);
    H = A;
    Q = eye(n);
    for k = 1:n-2
        y = H(k+1:end,k);
        x = zeros(n-k, 1);
        x(1) = norm(y);
        w = (x - y) / norm(x - y);
        h = eye(n-k) - 2 * w * w';
        h = [eye(k), zeros(k, n-k); zeros(n-k, k), h];
        H = h * H * h';
        Q = h * Q;
    end
end
        
    