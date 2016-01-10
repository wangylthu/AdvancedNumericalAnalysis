function [A, b] = Variational(p, q, f, n, h)
    A = zeros(n);
    b = zeros(n, 1);
    for k = 1:n
        if k == 1 || k == n
            b(k) = f(k)/2 * h;
        else
            b(k) = f(k) * h;
        end
    end
    
    for k = 1:n
        if k == 1 || k == n
            A(k,k) = 1/h * p(k) + 1/3 * q(k) * h;
        else
            A(k,k) = 2/h * p(k) + 2/3 * q(k) * h;
        end
    end
    
    for k = 1:n-1
        
        A(k,k+1) = -p(k)/h + q(k)/6 * h;
        A(k+1,k) = A(k,k+1);
    end
end
    
    