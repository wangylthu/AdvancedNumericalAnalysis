function [Q, H] = Arnoldi(A, b)
    m = size(A, 1);
    H = zeros(m);
    Q = zeros(m);
    q1 = b / norm(b);
    Q(:,1) = q1;
    for k = 1:m
        for j = 1:k
            H(j,k) = Q(:,j)' * A * Q(:,k);
        end
        r = A * Q(:,k) - Q(:,1:k) * H(1:k,k);
        h = norm(r);
        if h == 0 || k == m
            break;
        else
            Q(:,k+1) = r / h;
            H(k+1,k) = h;
        end
    end
end
    