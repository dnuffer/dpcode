"""
>>> rotate([[1, 2], [3, 4]])
[[3, 1], [4, 2]]
>>> rotate([[1, 2]])
[[1], [2]]
>>> rotate([[1]])
[[1]]
>>> rotate([[1, 2, 3], [4, 5, 6]])
[[4, 1], [5, 2], [6, 3]]
>>> rotate([[1, 2], [3, 4], [5, 6]])
[[5, 3, 1], [6, 4, 2]]
>>> rotate([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
[[7, 4, 1], [8, 5, 2], [9, 6, 3]]
"""

# TODO: Write rotate() which rotates a NxM matrix clockwise by 90 degrees.

if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
