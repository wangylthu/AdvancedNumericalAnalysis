function [x, err] = SGD(b, A, x0, max_iter, eps)
    x = x0;
    e = b - A * x;
    err = norm(e);
    
    for k = 1:max_iter
        if err(end) <= eps
            break;
        else
            r = b - A * x;
            alpha = r' * r / (r' * A * r);
            x = x + alpha * r;
            e = b - A * x;
            err = [err, norm(e)];
        end
    end
end
    
