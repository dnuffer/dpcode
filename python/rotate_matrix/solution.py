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

def rotate_list_comprehension(m):
	return [ [m[len(m) - x - 1][y] for x in range(len(m))] for y in range(len(m[0])) ]

def rotate(m):
	res = []
	for y in range(len(m[0])):
		row = []
		for x in range(len(m)):
			row.append(m[len(m) - x - 1][y])
		res.append(row)
	return res
			
	

if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
