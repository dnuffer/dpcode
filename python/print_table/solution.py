"""
>>> print_table([])
<BLANKLINE>
>>> print_table([["x"]])
x
>>> print_table([["1"], ["2"]])
1
2
>>> print_table([["12", "34"], ["5", "6"]])
1234
5 6 
>>> print_table([["12", "34", "X"], ["5", "678", "Y"], ["901", "2", "ZA"]])
12 34 X 
5  678Y 
9012  ZA
"""
import timeit
import itertools
import re

def print_table(table):
  print format_table(table)

def format_table(table):
  rows = len(table)
  if rows == 0:
    return ""

  cols = len(table[0])
  col_widths = [max([len(table[row][col]) for row in xrange(rows)]) for col in xrange(cols)]
  return "\n".join(["".join(["%-*s" % (col_widths[col], table[row][col]) for col in xrange(cols)]) for row in xrange(rows)])


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
