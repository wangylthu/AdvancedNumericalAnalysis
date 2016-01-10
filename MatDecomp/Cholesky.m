function L = Cholesky(A)
    [m, ~] = size(A);
    L = zeros(m);
    for k = 1:m
        for j = 1:k
            if k == j
                L(k, j) = sqrt(A(k, j) - L(k, :) * L(j, :)');
            else
                L(k, j) = (A(k, j) - L(k, :) * L(j, :)') / L(j, j);
            end
        end
    end
end
