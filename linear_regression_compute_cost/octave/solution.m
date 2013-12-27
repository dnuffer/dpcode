function J = solution(X, y, theta)
%solution Compute cost for linear regression with multiple variables
%   J = solution(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y
%   The cost is 1/2m * sum((X * theta - y)^2)

m = rows(X);
inner = X * theta - y;
J = 1/(2*m) * inner' * inner;

end

test solution
%!test
%! assert(solution([10 20; 300 400], [5; 50], [5; 2]), 1267431.25, 1e-6)
