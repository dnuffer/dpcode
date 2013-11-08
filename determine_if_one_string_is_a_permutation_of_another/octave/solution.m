function TF = strings_are_permutations(s1, s2)
if length(s1) != length(s2)
	TF = 0
	return
end
TF = all(sort(s1) == sort(s2))
end

test solution
%!test
%! assert(strings_are_permutations("a", "a"))
%! assert(strings_are_permutations("ab", "ba"))
%! assert(strings_are_permutations("abc", "cba"))
%! assert(!strings_are_permutations("abc", "ba"))
%! assert(!strings_are_permutations("abc", "abcz"))
%! assert(!strings_are_permutations("abc", "abca"))
