function [d, Lf] = LR(M, max_iter, eps)
    n = size(M, 1);
    Lf = chol(M, 'lower');
    L = Lf.^2;
    Lnext = zeros(size(L));
    for k = 1:max_iter
        if abs(max(diag(L,-1))) < eps
            break;
        else
            Lnext(1,1) = L(1,1) + L(2,1);
            Lnext(2,1) = L(2,2) * L(2,1) / Lnext(1,1);
            
            for k = 2:n-1
                Lnext(k,k) = L(k,k) + L(k+1,k) - Lnext(k,k-1);
                Lnext(k+1,k) = L(k+1,k+1) * L(k+1,k) / Lnext(k,k);
            end
            
            Lnext(n,n) = L(n,n) - Lnext(n,n-1);
            L = Lnext;
            
            Lf = sqrt(Lnext);
            M = Lf' * Lf;
            d = diag(M);
        end
    end
end
                