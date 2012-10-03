"""
>>> escape_spaces_for_html("Mr John Smith")
'Mr%20John%20Smith'
>>> escape_spaces_for_html("Dan")
'Dan'
>>> escape_spaces_for_html("")
''
>>> escape_spaces_for_html(" ")
'%20'
"""

# TODO: Write escape_spaces_for_html that replaces spaces with %20


if __name__ == '__main__':
	import doctest
	doctest.testmod()
	
