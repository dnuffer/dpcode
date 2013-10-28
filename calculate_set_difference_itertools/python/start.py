"""
>>> list(set_difference([1, 2, 3], [1, 2]))
[]
>>> list(set_difference([], [1, 2, 3]))
[1, 2, 3]
>>> list(set_difference([1, 2, 3], [4, 5, 6]))
[4, 5, 6]
"""
import itertools

# TODO: implement set_difference(first, second) which returns the elements in second which are not in first using itertools

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
