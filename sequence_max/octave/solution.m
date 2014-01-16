function m = scratch(s)
m = max(s)
endfunction

test scratch
%!test
%! assert(scratch([1 2 3]), 3)
