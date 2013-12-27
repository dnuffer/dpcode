
%!test
%! [X_norm, mu, sigma] = scratch([1 3; 2 4; 3 5]);
%! assert(X_norm, [-1 -1; 0 0; 1 1]);
%! assert(mu, [2 4]);
%! assert(sigma, [1 1]);
