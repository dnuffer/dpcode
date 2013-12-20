function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%



J = -(1 / m) * ( log(    sigmoid(X * theta))' * y +
					 log(1 - sigmoid(X * theta))' * (1 - y)
				  );

grad = (1 / m) * X' * ( sigmoid(X * theta) - y );




% =============================================================

end

%!test
%! theta = [0; 0; 0];
%! X = [1.0000 34.6237 78.0247; 1.0000 30.2867 43.8950; 1.0000 35.8474 72.9022; 1.0000   60.1826   86.3086];
%! y = [0; 0; 0; 1];
%! [J, grad] = costFunction(theta, X, y);
%! assert(J, 0.69315, 1e-4)
%! assert(grad, [0.25000; 5.07190; 13.56416], 1e-4)
