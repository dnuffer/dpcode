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

def char_counts(s):
  res = {}
  for c in s:
    if c in res:
      res[c] += 1
    else:
      res[c] = 0
  return res

def are_permutations(x, y):
  return char_counts(x) == char_counts(y)


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
