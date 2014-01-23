"""
>>> pascal(0,0)
1
>>> pascal(1,1)
1
>>> pascal(1,2)
2
>>> pascal(1,3)
3
>>> pascal(2,3)
3
"""

def pascal(x, y):
  if x == 0 or x == y:
    return 1
  return pascal(x, y - 1) + pascal(x - 1, y - 1)

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
