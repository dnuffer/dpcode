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

def escape_spaces_for_html(s):
	return s.replace(" ", "%20")

if __name__ == '__main__':
	import doctest
	doctest.testmod()
	
