"""
>>> normalize(array([[1, 2], [3, 4]]))
(array([[-1., -1.],
       [ 1.,  1.]]), array([ 2.,  3.]), array([ 1.,  1.]))
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
