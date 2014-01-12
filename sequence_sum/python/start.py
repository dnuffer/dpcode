"""
>>> seqsum(xrange(4))
6
>>> seqsum([10, 20])
30
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
