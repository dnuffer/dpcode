function result = solution(W, bound)
  if length(W) == 0
    result = 0
    return
  end

  max_weights = zeros(1, bound + 1);
  for i = W(1)+1:bound + 1
    max_weights(i) = W(1);
  end

  for n = 2:length(W)
    for i = bound+1:-1:1
      if i > W(n)
        max_weights(i) = max(max_weights(i), max_weights(i - W(n)) + W(n));
      end
    end
  end

  result = max_weights(bound + 1);
end

test solution
%!test
%! assert(solution([], 9), 0)
%! assert(solution([1, 3, 6], 9), 9)
%! assert(solution([1, 3, 6], 8), 7)
%! assert(solution([1, 2, 3], 7), 6)
%! assert(solution([1, 2, 3], 6), 6)
%! assert(solution([1, 2, 3], 5), 5)
%! assert(solution([1, 2, 3], 4), 4)
%! assert(solution([1, 2, 3], 3), 3)
%! assert(solution([1, 2, 3], 2), 2)
%! assert(solution([1, 2, 3], 1), 1)
%! assert(solution([4, 2, 1], 7), 7)
%! assert(solution([4, 2, 1], 6), 6)
%! assert(solution([4, 2, 1], 5), 5)
%! assert(solution([4, 2, 1], 4), 4)
%! assert(solution([4, 2, 1], 3), 3)
%! assert(solution([4, 2, 1], 2), 2)
%! assert(solution([4, 2, 1], 1), 1)
%! assert(solution([3, 5, 7], 6), 5)

