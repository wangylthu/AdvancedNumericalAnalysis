function [x, err] = CG(b, A, x0, max_iter, eps)
    x = x0;
    r = b - A * x;
    err = norm(r);
    p = r;
    
    for k = 1:max_iter
        if err(end) <= eps
            break;
        else
            alpha = r' * r / (p' * A * p);
            x = x + alpha * p;
            old_r = r;
            r = b - A * x;
            beta = r' * r / (old_r' * old_r);
            p = r + beta * p;

            err = [err, norm(r)];
        end
    end
end