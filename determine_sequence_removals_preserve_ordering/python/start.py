"""
>>> find_removals([1,2,3], [2,3,4])
[1]
>>> find_removals([1,2,3], [3,4,5])
[1, 2]
>>> find_removals([1,2,3], [])
[1, 2, 3]
>>> find_removals([3,2,1], [])
[3, 2, 1]
>>> find_removals([], [1,2,3])
[]
"""

# TODO: Write find_removals() which returns a list containing the items that are in the first sequence 
# parameter and not in the second sequence parameter which preserves the order of items in the first
# sequence

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
