function Var = Variance(V1, V2)
Var = sum((V1-V2).^2);
end

%!test
%! assert(Variance([1, 1], mean([1, 1])), 0)
%! assert(Variance([1, 100], mean([1, 100])), 4900.5)
