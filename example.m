% This is a small example to show how to use the methods 
% The manopt toolbox is required to run the code

function example()

% Set seed for reproducibility
rng(0)

% Problem : Compute the top-r left/right singular vector of a matrix
n = 10;
r = 3;
m = 8;
a.M1 = stiefelfactory(n, r);
a.M2 = stiefelfactory(m, r);
M = productmanifold(a);

A = randn(n, m);
svdarray = svd(A);
fstar = sum(svdarray(1:r));
x0 = M.rand();
f = @(X) -trace(X.M1'*(A*X.M2)) + fstar;

% Specify tolerance and budget of function evaluations
tol = 1e-5;
evalMax = 100*M.dim();

% Call the derivative-free Riemannian optimization methods
[x1, fval1] = ExtRFD(f,M,x0,evalMax,tol);
[x2, fval2] = IntRFD(f,M,x0,evalMax,tol);

fprintf('Final function value for the method ExtRFD is %e\n',f(x1))
fprintf('Final function value for the method IntRFD is %e\n',f(x2))

figure
simplexGradient = (1:evalMax)/M.dim();
plot(simplexGradient,fval1,'-',simplexGradient,fval2,'--')

title("The methods have the same behaviour but ExtRFD requires less retractions")
xlabel("Number of simplex gradients")
ylabel("Function value")
yscale('log')
legend('ExtRFD','IntRFD')

end