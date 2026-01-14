function [x, fval] = ExtRFD(f, M, x0, evalMax, tol)

% Set seed for reproducibility
rng(0)

sigma = 1; % Initial value sigma0
tau = 1e2; % Initial value tau0
d = M.dim(); % Dimension of the manifold
innerIterMax = 500; % Maximum number of line search iterations

fval = zeros(1,evalMax);
f0 = f(x0);
fcalls = 1;
fval(fcalls) = f0;

while fcalls <= evalMax

    h = 2*tol / (5*tau*sqrt(d));
    E = tangentorthobasis(M,x0);
    computeFiniteDiff = true;

    for l = 1:innerIterMax

        % Evaluate (if needed) a new gradient approximation
        if computeFiniteDiff
            g0 = M.zerovec(x0);
            for j = 1:d
                xSample = superlincomb(x0,1,x0,h,M.tangent2ambient(x0,E{j}),problem); % Linear combination in the ambient space
                fSample = f(xSample);
                g0 = M.lincomb(x0,1,g0,(fSample-f0)/h,E{j});
            end

            fval(fcalls:min(fcalls+d,N)) = f0;
            fcalls = fcalls + d;
            if fcalls > N
                break
            end
        end
 
        % Check that the norm of the gradient approximation is large enough
        if ~computeFiniteDiff || M.norm(x0,g0) > 4/5 * tol
            xNew = M.retr(x0,g0,-1/sigma);
            fNew = f(xNew);
            fval(fcalls) = f0;
            fcalls = fcalls + 1;
            if fcalls > N
                break
            end

            % Check the sufficient decrease condition
            if f0 - fNew >= 1/(4*sigma) * M.norm(x0,g0)^2
                fval(fcalls) = fNew;
                x0 = xNew;
                f0 = fNew;
                sigma = sigma/2;
                break
            else
                sigma = 2*sigma;
                if tau < sigma
                    tau = 2*tau;
                    h = h/2;
                    computeFiniteDiff = true;
                else
                    computeFiniteDiff = false;
                end
            end
        else
            tau = 2*tau;
            h = h/2;
            computeFiniteDiff = true;
        end
    end
end

x = x0;
end