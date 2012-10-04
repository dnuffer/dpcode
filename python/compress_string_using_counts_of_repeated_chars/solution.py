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

def compress(s):
	result = ""
	if len(s) == 0:
		return result
	last = s[0]
	count = 0
	for c in s:
		if c == last and count < 9:
			count+=1
		else:
			result += last + str(count)
			count = 1
			last = c
	if len(result) <= len(s):
		return result + last + str(count)
	else:
		return s

if __name__ == '__main__':
	import doctest
	doctest.testmod()
