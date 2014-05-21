"""
>>> normalize(array([[1, 2], [3, 4]]))
(array([[-1., -1.],
       [ 1.,  1.]]), array([ 2.,  3.]), array([ 1.,  1.]))
"""

from numpy import *

def normalize(x):
  mu = mean(x, axis=0)
  sigma = std(x, axis=0)
  x_norm = (x - mu) / sigma
  return (x_norm, mu, sigma)


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
