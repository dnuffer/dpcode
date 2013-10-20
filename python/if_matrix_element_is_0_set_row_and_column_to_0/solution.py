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

def set_zeros(m):
	if len(m) == 0:
		return []

	num_cols = len(m[0])
	num_rows = len(m)

	# record which rows and columns have 0s
	zero_rows = [0 for x in xrange(num_rows)]
	zero_cols = [0 for x in xrange(num_cols)]
	for col in xrange(num_cols):
		for row in xrange(num_rows):
			if (m[row][col]) == 0:
				zero_rows[row] = 1
				zero_cols[col] = 1

	# zero out columns
	for col in xrange(num_cols):
		if zero_cols[col]:
			for row in xrange(num_rows):
				m[row][col] = 0

	# zero out rows
	for row in xrange(num_rows):
		if zero_rows[row]:
			for col in xrange(num_cols):
				m[row][col] = 0

	return m

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
