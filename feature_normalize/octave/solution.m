function [X_norm, mu, sigma] = solution(X)

mu = mean(X);
sigma = std(X);
X_norm = (X - repmat(mu, rows(X), 1)) ./ repmat(sigma, rows(X), 1);

end

test solution
%!test
%! [X_norm, mu, sigma] = solution([1 3; 2 4; 3 5]);
%! assert(X_norm, [-1 -1; 0 0; 1 1]);
%! assert(mu, [2 4]);
%! assert(sigma, [1 1]);
