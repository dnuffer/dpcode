function R2 = CategoryRSquared(V1, V2)
R2 = 1 - ((Variance(V1) + Variance(V2))/Variance([V1, V2]));
end

%!test
%! assert(CategoryRSquared([1, 1], [100, 100]), 1)
%! assert(CategoryRSquared([1, 100], [1, 100]), 0)
%! assert(CategoryRSquared([1, 2], [100, 101]), 0.99990, 1e-5)
