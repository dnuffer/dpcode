function R2 = FunctionRSquared(X, Y, F)
R2 = 1 - Variance(Y, feval(F, X)) / Variance(Y, mean(Y));
end

%!test
%! assert(FunctionRSquared([1, 2, 3, 4], [1, 1, 100, 100], @(x) mean(x)), -0.94031, 1e-5)
%! assert(FunctionRSquared([1, 2, 3, 4], [1, 1, 100, 100], @(x) 4 * x), -0.51597, 1e-5)
%! assert(FunctionRSquared([1, 2, 3, 4], [1, 1, 100, 100], @(x) 25 * (x) -24), 0.63249, 1e-5)
%! assert(FunctionRSquared([10, 20, 40, 80], [1, 1, 100, 100], @(x) 0.5 * x), -0.030201, 1e-5)
