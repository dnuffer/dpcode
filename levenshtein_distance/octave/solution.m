function dist = solution(src, tgt)
  if length(src) == 0
    dist = length(tgt);
    return;
  end
  if length(tgt) == 0
    dist = length(src);
    return;
  end

  if src(1) == tgt(1)
    dist = solution(src(2:end), tgt(2:end));
    return;
  else
    dist = min(
            solution(src(2:end), tgt(2:end)) + 1,
            min(
              solution(src, tgt(2:end)) + 1,
              solution(src(2:end), tgt) + 1));
  end
end

test solution
%!test
%! assert(solution("a", "a"), 0)
%! assert(solution("a", "b"), 1)
%! assert(solution("xa", "xb"), 1)
%! assert(solution("xa", "b"), 2)
%! assert(solution("electron", "neutron"), 3)

