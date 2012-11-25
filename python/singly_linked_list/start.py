"""
>>> l=singly_linked_list()
>>> l.data = 10
>>> l.data
10
>>> l.next == None
True
>>> l.append(20)
>>> l.next.data
20
>>> l.next.next == None
True

"""

# TODO: Implement a singly-linked list with next, data, and append()
			

if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
