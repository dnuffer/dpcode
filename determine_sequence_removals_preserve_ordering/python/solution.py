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

def find_removals(prev, cur):
  cur_set = set(cur)
  return filter(lambda item: item not in cur_set, prev)

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
