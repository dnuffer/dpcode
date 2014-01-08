

test scratch
%!test
%! assert(scratch([], 9), 0);
%!test
%! assert(scratch([1 3 6], 9), 9);
%!test
%! assert(scratch([1 3 6], 8), 7);
%!test
%! assert(scratch([1 2 3], 7), 6);
%!test
%! assert(scratch([1 2 3], 6), 6);
%!test
%! assert(scratch([1 2 3], 5), 5);
%!test
%! assert(scratch([1 2 3], 4), 4);
%!test
%! assert(scratch([1 2 3], 3), 3);
%!test
%! assert(scratch([1 2 3], 2), 2);
%!test
%! assert(scratch([1 2 3], 1), 1);
%!test
%! assert(scratch([4 2 1], 7), 7);
%!test
%! assert(scratch([4 2 1], 6), 6);
%!test
%! assert(scratch([4 2 1], 5), 5);
%!test
%! assert(scratch([4 2 1], 4), 4);
%!test
%! assert(scratch([4 2 1], 3), 3);
%!test
%! assert(scratch([4 2 1], 2), 2);
%!test
%! assert(scratch([4 2 1], 1), 1);
%!test
%! assert(scratch([3 5 7], 6), 5);
