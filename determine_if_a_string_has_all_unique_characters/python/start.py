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


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
