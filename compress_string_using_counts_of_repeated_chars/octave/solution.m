function compressed = solution(s)
  compressed = '';
  if length(s) == 0
    return;
  endif
  cur_len = 1;
  cur = s(1);

  for i = 2:length(s)
    if s(i) == cur && cur_len < 9
      cur_len += 1;
    else
      compressed(length(compressed) + 1) = cur;
      compressed(length(compressed) + 1) = int2str(cur_len);
      cur_len = 1;
      cur = s(i);
    endif
  endfor
  compressed(length(compressed) + 1) = cur;
  compressed(length(compressed) + 1) = int2str(cur_len);

  if length(compressed) > length(s)
    compressed = s;
  endif
endfunction

test solution
%!test
%! assert(solution('aabcccccaaa'), 'a2b1c5a3')
%! assert(solution('abc'), 'abc')
%! assert(solution('aaaaaa'), 'a6')
%! assert(solution('aaaaaaaaa'), 'a9')
%! assert(solution('aaaaaaaaaa'), 'a9a1')
%! assert(solution('aa'), 'a2')
%! assert(solution(''), '')
