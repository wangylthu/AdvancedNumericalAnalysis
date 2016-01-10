function lambda = Strum(A, a, b, mininter)
    lambda = [];
    if b - a <= mininter
        lambda = 0.5 * (a + b);
        return
    else
        ca = Counter(EigenPoly(A, a));
        cb = Counter(EigenPoly(A, b));
        if ca > cb
            lambda = Strum(A, a, 0.5*(a+b), mininter);
            lambda = [lambda, Strum(A, 0.5*(a+b), b, mininter)];
            lambda = amalgate(lambda, mininter);
            return
        end
    end
end

function p = EigenPoly(A, x)
    p = [0, 1, x - A(1,1)];
    n = size(A, 1);
    for k = 2:n
        pk = (x - A(k,k)) * p(end) - A(k, k-1)^2 * p(end-1);
        p = [p, pk];
    end
    p = p(2:end);
end

function count = Counter(p)
    n = length(p);
    signs = sign(p);
    count = 0;
    for k = 2:n
        if signs(k) == 0
            signs(k) = signs(k-1);
        end
    end
    
    flag = signs(1);
    for k = 2:n
        if signs(k) ~= flag
            flag = signs(k);
            count = count + 1;
        end
    end
end

function p = amalgate(l, mininter)
    p = l(1);
    for k = 2:length(l)
        if l(k) - l(k-1) > mininter
            p = [p, l(k)];
        end
    end
end
        