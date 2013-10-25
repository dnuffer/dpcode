function [X_norm, mu, sigma] = featureNormalize(X)
%featureNormalize Normalizes the features in X 
%   featureNormalize(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1.

mu=mean(X);
sigma=std(X);
X_norm = (X - ones(rows(X), rows(mu)) * mu) ./ (ones(rows(X), rows(mu)) * sigma);

end
