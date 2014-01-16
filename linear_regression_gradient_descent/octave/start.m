function [theta, J_history] = scratch(X, y, theta, alpha, num_iters)
%scratch Performs gradient descent to learn theta
%   theta = scratch(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha


end

test scratch
%!test
%! X = [1 2; 3 4];
%! y = [5; 6];
%! theta = [7; 8];
%! alpha = .1;
%! num_iters = 10;
%! [thetaRes, J_history] = scratch(X, y, theta, alpha, num_iters);
%! assert(J_history, [   155.3113; 38.9895; 10.6669; 3.7589; 2.0623; 1.6341; 1.5148; 1.4709; 1.4455; 1.4248], 1e-4)
%! assert(thetaRes, [   1.33580; 0.74936], 1e-5)

