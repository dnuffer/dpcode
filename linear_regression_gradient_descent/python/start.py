"""
>>> X = array([[1, 2], [3, 4]])
>>> y = array([[5], [6]])
>>> theta = array([[7], [8]])
>>> alpha = .1
>>> num_iters = 10
>>> thetaRes, J_history = gradDesc(X, y, theta, alpha, num_iters)
>>> print thetaRes
[[ 1.3358015 ]
 [ 0.74936039]]
>>> print J_history
[155.31125000000009, 38.989512500000011, 10.666869250000008, 3.7588672262500018, 2.0622913813625003, 1.6341143780532505, 1.5148045243403614, 1.4708587027680591, 1.445451638110592, 1.4247523403414166]
"""
from numpy import *

def computeCost(X, y, theta):
  m = y.shape[0]
  return (1.0 / (2.0 * m)) * dot((dot(X, theta) - y).T, (dot(X, theta) - y))[0,0]



if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
