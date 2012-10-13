"""
>>> are_permutations("abc", "cab")
True
>>> are_permutations("abc", "aab")
False
>>> are_permutations("abcd", "abc")
False
>>> are_permutations("", "")
True
>>> are_permutations("a", "a")
True
>>> are_permutations("aaa", "aaa")
True
"""

# TODO: Write are_permutations that determines if one string is a permutation of another

if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
