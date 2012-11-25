"""
>>> from itertools import islice
>>> islice(gen_fib(), 1).next()
1
>>> list(islice(gen_fib(), 5))
[1, 1, 2, 3, 5]
"""

# TODO: write gen_fib() that returns a generator of the fibonacci sequence

if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
