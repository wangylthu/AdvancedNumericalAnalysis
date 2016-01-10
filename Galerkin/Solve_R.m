function y = Solve_R(g, R)
    n = size(g, 1);
    y = zeros(n, 1);
    for k = n:-1:1
        y(k) = (g(k) - R(k, k:n) * y(k:n)) / R(k,k);
    end
end