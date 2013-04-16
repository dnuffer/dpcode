"""
>>> sll = singly_linked_list([1])
>>> print sll[0]
1
>>> sll = singly_linked_list([1, 2, 3])
>>> print sll[0]
1
>>> print sll[1]
2
>>> print sll[2]
3
>>> sll = singly_linked_list(["A", "b", "C"])
>>> sll[0]
'A'
>>> sll[-1]
'C'
>>> sll[-2]
'b'
>>> sll[-3]
'A'
>>> sll[-4]
Traceback (most recent call last):
  ...
IndexError: list index out of range
>>> sll[10]
Traceback (most recent call last):
  ...
IndexError: list index out of range
"""

import sys
sys.path.insert(0, '../singly_linked_list_complete')

from singly_linked_list import singly_linked_list

# TODO: Write singly_linked_list __getitem__


singly_linked_list.__getitem__ = sll__getitem__

if __name__ == '__main__':
  import doctest
  if doctest.testmod().failed > 0:
    import sys
    sys.exit(1)
