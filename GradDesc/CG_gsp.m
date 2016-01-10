function [x, err] = CG_gsp(b, A, x0, M_inv, max_iter, eps)
    x = x0;
    r = b - A * x;
    err = norm(r);
    p = M_inv * r;
    y = M_inv * r;
    for k = 1:max_iter
        if err(end) <= eps
            break;
        else
            alpha = y' * r / (p' * A * p);
            x = x + alpha * p;
            old_y = y;
            old_r = r;
            r = old_r - alpha * A * p;
            y = M_inv * r;
            beta =  y' * r / (old_y' * old_r);
            p = y + beta * p;

            err = [err, norm(r)];
        end
    end
end