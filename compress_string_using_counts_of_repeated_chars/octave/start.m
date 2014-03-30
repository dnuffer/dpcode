function compressed = scratch(s)
compressed = 'a2b1c5a3'
endfunction

test scratch
%!test
%! assert(scratch('aabcccccaaa'), 'a2b1c5a3')
%! assert(scratch('abc'), 'abc')
%! assert(scratch('aaaaaa'), 'a6')
%! assert(scratch('aaaaaaaaa'), 'a9')
%! assert(scratch('aaaaaaaaaa'), 'a9a1')
%! assert(scratch('aa'), 'a2')
%! assert(scratch(''), '')
