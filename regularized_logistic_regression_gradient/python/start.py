"""
>>> theta = array([[0.], [0.], [0.]])
>>> X = array([[1.0000,34.6237,78.0247],[1.0000,30.2867,43.8950],[1.0000,35.8474,72.9022],[1.0000,60.1826,86.3086]])
>>> y = array([[0.],[0.],[0.],[1.]]);
>>> J, grad = cost_function_reg(theta, X, y, 0);
>>> print(J)
0.69314718056
>>> print(grad)
[[  0.25     ]
 [  5.0719   ]
 [ 13.5641625]]


>>> theta = array([[-0.1], [-0.1], [-0.1]])
>>> X = array([[1.0000,34.6237,78.0247],[1.0000,30.2867,43.8950],[1.0000,35.8474,72.9022],[1.0000,60.1826,86.3086]])
>>> y = array([[0.],[0.],[0.],[1.]]);
>>> J, grad = cost_function_reg(theta, X, y, 0);
>>> print(J)
3.68742302309
>>> print(grad)
[[ -0.24985701]
 [-15.0412801 ]
 [-21.57064632]]


>>> theta = array([[-0.1], [-0.1], [-0.1]])
>>> X = array([[1.0000,34.6237,78.0247],[1.0000,30.2867,43.8950],[1.0000,35.8474,72.9022],[1.0000,60.1826,86.3086]])
>>> y = array([[0.],[0.],[0.],[1.]]);
>>> J, grad = cost_function_reg(theta, X, y, 1.);
>>> print(J)
3.68992302309
>>> print(grad)
[[ -0.24985701]
 [-15.0662801 ]
 [-21.59564632]]
"""
from numpy import *

def sigmoid(z):
  return 1. / (1. + exp(-z))

def cost_function_reg(theta, X, y, lambda_reg):
  m = y.shape[0]
  theta_reg = theta.copy()
  theta_reg[0] = 0.
  sigmoid_temp = sigmoid(dot(X, theta))
  J = (-1. / m) * ( dot(log(     sigmoid_temp).T,       y) + \
                    dot(log(1. - sigmoid_temp).T, (1. - y)) \
                 ) \
      + \
      lambda_reg / (2. * m) * dot(theta_reg.T, theta_reg)

  # TODO: set grad = <the gradient>

  return (J[0,0], grad)

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
