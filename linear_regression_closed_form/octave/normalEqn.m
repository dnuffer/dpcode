function [theta] = normalEqn(X, y)
%normalEqn Computes the closed-form solution to linear regression 
%   normalEqn(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

theta = pinv(X' * X) * X' * y;

end
