"""
>>> print is_palindrome(singly_linked_list([1]))
True
>>> print is_palindrome(singly_linked_list([1, 1]))
True
>>> print is_palindrome(singly_linked_list([1, 2]))
False
>>> print is_palindrome(singly_linked_list([1, 2, 1]))
True
>>> print is_palindrome(singly_linked_list([1, 2, 3]))
False
>>> print is_palindrome(singly_linked_list([1, 2, 2, 1]))
True
>>> print is_palindrome(singly_linked_list([1, 2, 2, 99]))
False
>>> print is_palindrome(singly_linked_list([1, 2, 3, 2, 1]))
True
"""

import sys
sys.path.insert(0, '../singly_linked_list_complete')

from singly_linked_list import singly_linked_list, singly_linked_list_node

# TODO: write a function that returns whether a linked list is a palindrome


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
