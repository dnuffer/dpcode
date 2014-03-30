function result = scratch(x)
iters = 1000;
p = x / 2;
for i = 1:iters
  p0 = p - ((p ^ 2) - x) / (2 * p);
  if abs(p - p0) < 1e-6
    result = p0;
    return;
  endif
  p = p0;
endfor
result = p0;
endfunction

test scratch
%!test
%! assert(scratch(4), 2)
%! assert(scratch(9), 3)
