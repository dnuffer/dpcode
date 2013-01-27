"""
>>> find_removals([1,2,3], [2,3,4])
set([1])
>>> find_removals([1,2,3], [3,4,5])
set([1, 2])
>>> find_removals([1,2,3], [])
set([1, 2, 3])
>>> find_removals([3,2,1], [])
set([1, 2, 3])
>>> find_removals([], [1,2,3])
set([])
"""

def find_removals(prev, cur):
  return set(prev) - set(cur)

if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
