function [J, grad] = costFunctionReg(theta, X, y, lambda)
m = length(y); % number of training examples
thetaReg = theta;
thetaReg(1) = 0;

J = -(1 / m) * ( log(    sigmoid(X * theta))' * y +
		 log(1 - sigmoid(X * theta))' * (1 - y)
		) ...
    + ...
      lambda / (2 * m) * thetaReg' * thetaReg;

grad = (1 / m) * X' * ( sigmoid(X * theta) - y ) + (lambda / m * thetaReg);
end

test solution
%!test
%! data = load('ex2data1.txt');
%! X = data(:, [1, 2]); 
%! y = data(:, 3);
%! [m, n] = size(X);
%! X = [ones(m, 1) X];
%! initial_theta = zeros(n + 1, 1);
%! options = optimset('GradObj', 'on', 'MaxIter', 400);
%! [theta, cost] = fminunc(@(t)(costFunctionReg(t, X, y, 1)), initial_theta, options);
%! assert(theta, [-25.05233; 0.20536; 0.20059], 1e-4)
%! assert(cost, 0.20391, 1e-4);
