function result = solution(x, y)
  if x == 0 || x == y
    result = 1;
  else
    result = solution(x - 1, y - 1) + solution(x, y - 1);
  endif
endfunction

test solution
%!test
%! assert(solution(0, 2), 1);
%! assert(solution(1, 2), 2);
%! assert(solution(1, 3), 3);
