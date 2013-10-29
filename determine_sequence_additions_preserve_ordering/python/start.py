"""
>>> find_additions([1,2,3], [2,3,4])
[4]
>>> find_additions([1,2,3], [3,4,5])
[4, 5]
>>> find_additions([1,2,3], [])
[]
>>> find_additions([], [1,2,3])
[1, 2, 3]
>>> find_additions([], [3,2,1])
[3, 2, 1]
"""

# TODO: Write find_additions() which returns a list containing the items that are in the second sequence 
# parameter and not in the first sequence parameter which preserves the order of items in the second
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
