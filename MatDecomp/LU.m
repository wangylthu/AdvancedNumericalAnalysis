function [L, U] = LU(A)
    [m, ~] = size(A);
    L = zeros(m);
    U = zeros(m);
    for k = 1:m
        for j = 1:k
            if k == j
                L(k, j) = 1;
            else
                L(k, j) = (A(k, j) - L(k,:) * U(:,j)) / U(j, j);
            end
        end
        
        for i = 1:k
            U(i, k) = A(i, k) - L(i,:) * U(:,k);
        end
    end
end
            