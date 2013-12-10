function nested = solution(str)
  count = 0;
  for i = 1:length(str)
    if str(i) == ')'
      count--;
      if count < 0
        nested = false;
        return
      end
    elseif str(i) == '('
      count++;
    end
  end
  nested = (count == 0);
end

test solution
%!test
%! assert(solution("a"), true)
%! assert(solution("(a)"), true)
%! assert(solution("("), false)
%! assert(solution(")"), false)
%! assert(solution(")("), false)

