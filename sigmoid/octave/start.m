function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).




% =============================================================

end

test scratch
%!test
%! assert(sigmoid(0),   .5)
%! assert(sigmoid(1),  0.73106, 1e-5)
%! assert(sigmoid(-1), 0.26894, 1e-5)
%! assert(sigmoid([1 10 100]), [0.73106   0.99995   1.00000], 1e-5)
%! assert(sigmoid([1; 10; 100]), [0.73106;   0.99995;   1.00000], 1e-5)
%! assert(sigmoid([1 2; 3 4]), [   0.73106   0.88080; 0.95257   0.98201 ], 1e-5)
