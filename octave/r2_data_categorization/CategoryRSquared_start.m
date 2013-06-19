
%!test
%! assert(CategoryRSquared([1, 1], [100, 100]), 1)
%! assert(CategoryRSquared([1, 100], [1, 100]), 0)
%! assert(CategoryRSquared([1, 2], [100, 101]), 0.99990, 1e-5)
