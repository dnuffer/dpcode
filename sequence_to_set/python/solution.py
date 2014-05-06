"""
>>> seq_to_set([1, 2, 3])
set([1, 2, 3])
"""

def seq_to_set(seq):
  return set(seq)

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
