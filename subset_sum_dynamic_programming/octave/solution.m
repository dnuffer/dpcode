function result = solution(W, bound)
  if length(W) == 0
    result = 0
    return
  end

  max_weights = zeros(1, bound + 1);
  max_weights(W(1)+1:end) = W(1);

  for n = 2:length(W)
    for i = bound+1:-1:1
      if i > W(n)
        max_weights(i) = max(max_weights(i), max_weights(i - W(n)) + W(n));
      end
    end
  end

  result = max_weights(end);
end

test solution
%!test
%! assert(solution([], 9), 0)
%!test
%! assert(solution([1, 3, 6], 9), 9)
%!test
%! assert(solution([1, 3, 6], 8), 7)
%!test
%! assert(solution([1, 2, 3], 7), 6)
%!test
%! assert(solution([1, 2, 3], 6), 6)
%!test
%! assert(solution([1, 2, 3], 5), 5)
%!test
%! assert(solution([1, 2, 3], 4), 4)
%!test
%! assert(solution([1, 2, 3], 3), 3)
%!test
%! assert(solution([1, 2, 3], 2), 2)
%!test
%! assert(solution([1, 2, 3], 1), 1)
%!test
%! assert(solution([4, 2, 1], 7), 7)
%!test
%! assert(solution([4, 2, 1], 6), 6)
%!test
%! assert(solution([4, 2, 1], 5), 5)
%!test
%! assert(solution([4, 2, 1], 4), 4)
%!test
%! assert(solution([4, 2, 1], 3), 3)
%!test
%! assert(solution([4, 2, 1], 2), 2)
%!test
%! assert(solution([4, 2, 1], 1), 1)
%!test
%! assert(solution([3, 5, 7], 6), 5)
