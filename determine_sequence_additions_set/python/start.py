"""
>>> find_additions([1,2,3], [2,3,4])
set([4])
>>> find_additions([1,2,3], [3,4,5])
set([4, 5])
>>> find_additions([1,2,3], [])
set([])
>>> find_additions([], [1,2,3])
set([1, 2, 3])
>>> find_additions([], [3,2,1])
set([1, 2, 3])
"""

# TODO: Write find_additions() which returns a set containing the items that are in the second sequence 
# parameter and not in the first sequence parameter

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
