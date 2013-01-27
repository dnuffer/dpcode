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

# TODO: Write find_removals() which returns a set containing the items that are in the first sequence 
# parameter and not in the second sequence parameter

if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
