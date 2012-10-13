"""

>>> has_unique_characters("abc")
True
>>> has_unique_characters("aaa")
False
>>> has_unique_characters(u"abc")
True
>>> has_unique_characters(u"aaa")
False
"""

def has_unique_characters(s):
    return len(s) == len(set(s))

if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
