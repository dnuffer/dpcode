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

def find_additions(prev, cur):
  prev_set = set(prev)
  return filter(lambda item: item not in prev_set, cur)

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
