function [g, R] = QR_givens(h, H)
    n = size(h, 1);
    g = h;
    R = H;
    for k = 1:n-1
        G = givens(R(k,k), R(k+1,k));
        R(k:k+1,:) = G * R(k:k+1,:);
        g(k:k+1,:) = G * g(k:k+1,:);
    end
end