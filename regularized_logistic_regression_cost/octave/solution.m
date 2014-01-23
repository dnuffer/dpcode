function [J, grad] = costFunctionReg(theta, X, y, lambda)

  m = length(y); % number of training examples

  % Don't want to regularize theta(1)
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
%! theta = [0; 0; 0];
%! X = [1.0000 34.6237 78.0247; 1.0000 30.2867 43.8950; 1.0000 35.8474 72.9022; 1.0000   60.1826   86.3086];
%! y = [0; 0; 0; 1];
%! [J, grad] = costFunctionReg(theta, X, y, 0);
%! assert(J, 0.69315, 1e-4);
%! assert(grad, [0.25000; 5.07190; 13.56416], 1e-4);
%!
%! theta = [-0.1; -0.2; 0.5];
%! X = [1.0000 34.6237 78.0247; 1.0000 30.2867 43.8950; 1.0000 35.8474 72.9022; 1.0000   60.1826   86.3086];
%! y = [0; 0; 0; 1];
%! [J, grad] = costFunctionReg(theta, X, y, 0);
%! assert(J, 19.239, 1e-3);
%! assert(grad, [0.75000; 25.18945; 48.70547], 1e-3);
%!
%! theta = [-0.1; -0.2; 0.5];
%! X = [1.0000 34.6237 78.0247; 1.0000 30.2867 43.8950; 1.0000 35.8474 72.9022; 1.0000   60.1826   86.3086];
%! y = [0; 0; 0; 1];
%! [J, grad] = costFunctionReg(theta, X, y, 1);
%! assert(J, 19.275, 1e-3);
%! assert(grad, [0.75000; 25.13945; 48.83047], 1e-3);
