"""
>>> X = array([[10, 20], [300, 400]])
>>> y = array([[5], [50]])
>>> theta = array([[5], [2]])
>>> J = computeCost(X, y, theta)
>>> print J
1267431.25
"""
from numpy import *


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result


