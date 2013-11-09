function out = mapFeature(X1, X2, n = 6)
% MAPFEATURE Feature mapping function to polynomial features up to the nth power
%
%   MAPFEATURE(X1, X2) maps the two input features
%   to quadratic features up to the nth power.
%
%   Returns a new feature array with more features, comprising of 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   Inputs X1, X2 must be the same size
%

degree = n;
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end

test solution
%!test
%! assert(mapFeature([2; 3], [4; 5], 4), 
%! [1 2 4 4 8 16 8 16 32 64 16 32 64 128 256;
%!  1 3 5 9 15 25 27 45 75 125 81 135 225 375 625]);

