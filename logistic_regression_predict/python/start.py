"""
>>> t = array([[-25.16154], [0.20623], [0.20147]])
>>> print predict(t, array([1.0,45,85]))
[ 1.]
>>> print predict(t, array([[1.0,45,85], [1.0,30,30]]))
[[ 1.]
 [ 0.]]
"""
from numpy import *

def sigmoid(z):
  return 1. / (1. + exp(-z))

# TODO: write predict()

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
