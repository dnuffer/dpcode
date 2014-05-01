"""
>>> theta = array([[0.], [0.], [0.]])
>>> X = array([[1., 34.6237, 78.0247], [1., 30.2867, 43.8950], [1.0000,35.8474, 72.9022], [1.0000, 60.1826,86.3086]])
>>> y = array([[0.], [0.], [0.], [1.]])
>>> J, grad = costFunction(theta, X, y)
>>> print "{0:0.5f}".format(J)
0.69315
>>> print grad
[[  0.25     ]
 [  5.0719   ]
 [ 13.5641625]]
"""

from numpy import *

def sigmoid(z):
  return 1. / (1. + exp(-z))

def costFunction(theta, X, y):
  m = y.shape[0]
  sigmoid_xdt = sigmoid(dot(X, theta))
  J = -(1. / m) * ( dot(log(sigmoid_xdt).T, y) + dot(log(1. - sigmoid_xdt).T, 1. - y))[0,0]
  grad = (1. / m) * dot(X.T, (sigmoid_xdt - y))
  return (J, grad)

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result

