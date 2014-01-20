"""
>>> sigmoid(0)
0.5
>>> sigmoid(1)
0.7310585786300049
>>> sigmoid(-1)
0.2689414213699951
>>> sigmoid(array([1, 10, 100]))
array([ 0.73105858,  0.9999546 ,  1.        ])
>>> sigmoid(array([[1], [10], [100]]))
array([[ 0.73105858],
       [ 0.9999546 ],
       [ 1.        ]])
>>> sigmoid(array([[1, 2], [3, 4]]))
array([[ 0.73105858,  0.88079708],
       [ 0.95257413,  0.98201379]])

"""


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
