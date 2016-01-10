function [Q, H] = Lanczos(A, b)
    m = size(A, 1);
    H = zeros(m);
    Q = zeros(m);
    q1 = b / norm(b);
    Q(:,1) = q1;
    H(1,1) = q1' * A * q1;
    for k = 1:m
        H(k,k) = Q(:,k)' * A * Q(:,k);
        if k == 1
            r = A * Q(:,k) - Q(:,k) * H(k,k);
        else
            r = A * Q(:,k) - Q(:,k-1:k) * H(k-1:k,k);
        end
        
        h = norm(r);
        if h == 0 || k == m
            break;
        else
            Q(:,k+1) = r / h;
            H(k+1,k) = h;
            H(k,k+1) = h;
        end
    end
end             