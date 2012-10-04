"""
>>> compress("aabcccccaaa")
'a2b1c5a3'
>>> compress("abc")
'abc'
>>> compress("aaaaaa")
'a6'
>>> compress("aaaaaaaaa")
'a9'
>>> compress("aaaaaaaaaa")
'a9a1'
>>> compress("aa")
'a2'
>>> compress("")
''
"""

# TODO: Implement compress() to perform basic string compression using the
# counts of repeated characters. The count can only be one digit.
# If the "compressed" string would not become smaller than the original
# string, it should return the original.

if __name__ == '__main__':
	import doctest
	doctest.testmod()
