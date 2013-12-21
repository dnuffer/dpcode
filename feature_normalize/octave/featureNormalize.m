function [X_norm, mu, sigma] = featureNormalize(X)
%featureNormalize Normalizes the features in X 
%   featureNormalize(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1.

mu=mean(X);
sigma=std(X);
X_norm = (X - ones(rows(X), 1) * mu) ./ (ones(rows(X), 1) * sigma);

end
%!test
%! [X_norm, mu, sigma] = featureNormalize([1 3; 2 4; 3 5]);
%! assert(X_norm, [-1 -1; 0 0; 1 1]);
%! assert(mu, [2 4]);
%! assert(sigma, [1 1]);
