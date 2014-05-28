"""
>>> binary_search([0], 0)
0
>>> binary_search([], 0)
-1
>>> binary_search([0], 1)
-1
>>> binary_search([1, 2], 1)
0
>>> binary_search([1, 2], 2)
1
>>> binary_search([1, 2, 3], 1)
0
>>> binary_search([1, 2, 3], 2)
1
>>> binary_search([1, 2, 3], 3)
2
>>> binary_search([1, 1], 1)
0
>>> binary_search([3, 4, 5, 5, 5, 6], 5)
2
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



