function [Q, A] = DC_eigs(T, n)
    if n == 1
        Q = 1;
        A = T;
    else
        beta = T(n/2+1, n/2);
        T1 = T(1:n/2,1:n/2);
        T1(n/2, n/2) = T1(n/2, n/2) - beta;
        T2 = T(n/2+1:n, n/2+1:n);
        T2(1,1) = T2(1, 1) - beta;
        
        [Q1, A1] = DC_eigs(T1, n/2);
        [Q2, A2] = DC_eigs(T2, n/2);
        
        Q = [Q1,zeros(n/2);zeros(n/2),Q2];
        D = [A1,zeros(n/2);zeros(n/2),A2];
        
        v = zeros(n, 1);
        v(n/2) = 1; v(n/2+1) = 1;
        u = Q' * v;
        
        ds = fsolve(eigpoly(u, D, beta), max(D(:))-1e-4);
        q = [];
        for k = 1:n
            qk = diag(1./(diag(D) - ds(k))) * u;
            qk = qk / norm(qk);
            q = [q, qk];
        end
        
        A = diag(ds);
        Q = Q * q;
    end
end

function f = eigpoly(u, D, beta)
    d = diag(D);
    f = @(x) 1 + beta * u.^2 ./ (d - x);
end
    