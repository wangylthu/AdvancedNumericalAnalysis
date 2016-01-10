function [x, err] = GMRES_m(b, A, x0, m, max_iter, eps)
    x = x0;
    r = b - A * x0;
    err = norm(r);
    for k = 1:max_iter
        if err(end) < eps
            break;
        else
            Q = zeros(size(A, 1), m+1);
            H = zeros(m+1, m);
            Q(:,1) = r / norm(r);
            H(1,1) = Q(:,1)' * A * Q(:,1);
            for j = 1:m
                for i = 1:j
                    H(i,j) = Q(:,i)' * A * Q(:,j);
                end
                res = A * Q(:,j) - Q(:,1:j) * H(1:j,j);
                h = norm(res);
                H(j+1,j) = h;
                Q(:,j+1) = res / h;
            end
            
            beta_e1 = zeros(m, 1);
            beta_e1(1) = norm(r);
            [g, R] = QR_givens(beta_e1, H(1:m,:));
            y = Solve_R(g, R);
            
            x = x + Q(:,1:m) * y;
            err = [err, abs(y(end) * H(m+1,m))];
            r = b - A * x;
        end
    end
end