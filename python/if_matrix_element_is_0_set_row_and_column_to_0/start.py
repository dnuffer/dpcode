"""
>>> set_zeros([])
[]
>>> set_zeros([[1]])
[[1]]
>>> set_zeros([[1, 0]])
[[0, 0]]
>>> set_zeros([[1, 0], [1, 1]])
[[0, 0], [1, 0]]
>>> set_zeros([[1, 1], [0, 1]])
[[0, 1], [0, 0]]
"""

# Write set_zeros such that if an element in an MxN matrix is 0, its entire
# row and column are set to 0.

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
