"""
>>> list(set_difference([1, 2, 3], [1, 2]))
[]
>>> list(set_difference([], [1, 2, 3]))
[1, 2, 3]
>>> list(set_difference([1, 2, 3], [4, 5, 6]))
[4, 5, 6]
"""
import timeit
import itertools
import re

def set_difference(first, second):
  first_set = set(first)
  for x in second:
    if x not in first_set:
      yield x

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
