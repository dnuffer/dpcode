function J = computeCost(X, y, theta)
%computeCost Compute cost for linear regression with multiple variables
%   J = computeCost(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

m = length(y); % number of training examples

J = (1 / (2 * m)) * (X * theta - y)' * (X * theta - y);

end
%!test
%! assert(computeCost([10 20; 300 400], [5; 50], [5; 2]), 1267431.25, 1e-6)
