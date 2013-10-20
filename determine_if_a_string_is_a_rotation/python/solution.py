"""

>>> is_rotation("abc", "abc")
True
>>> is_rotation("aaa", "aa")
False
>>> is_rotation(u"abc", u"bca")
True
>>> is_rotation('waterbottle', 'erbottlewat')
True
>>> is_rotation('waterbottle', 'rbottlewat')
False
>>> is_rotation('waterbottle', 'Erbottlewat')
False
"""

def is_rotation(s1, s2):
  if len(s1) != len(s2):
    return False
  return s2 in s1 + s1

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
