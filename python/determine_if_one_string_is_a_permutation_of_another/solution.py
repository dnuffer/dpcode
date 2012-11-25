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
>>> are_permutations("aaa", "aaaa")
False
>>> are_permutations("aab", "abb")
False
"""

def add_str_count_to_dict(d, s):
  if s in d:
    d[s] += 1
  else:
    d[s] = 0
  return d

def get_char_counts(s):
  return reduce(add_str_count_to_dict, s, dict())

def are_permutations(s1, s2):
  return get_char_counts(s1) == get_char_counts(s2)


if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
