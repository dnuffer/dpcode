"""
>>> sll1 = singly_linked_list([7, 1, 6])
>>> sll2 = singly_linked_list([5, 9, 2])
>>> print add_lists(sll1, sll2)
[2 -> 1 -> 9]
>>> sll1 = singly_linked_list([7, 1, 6, 4])
>>> sll2 = singly_linked_list([5, 9, 2])
>>> print add_lists(sll1, sll2)
[2 -> 1 -> 9 -> 4]
>>> sll1 = singly_linked_list([7, 1, 6])
>>> sll2 = singly_linked_list([5, 9, 2, 4])
>>> print add_lists(sll1, sll2)
[2 -> 1 -> 9 -> 4]
"""

import sys
sys.path.insert(0, '../singly_linked_list_complete')

from singly_linked_list import singly_linked_list, singly_linked_list_node

# TODO: You have two numbers represented by a linked list, where each node
# contains a single digit. The digits are stored in reverse order, such that
# 1's digit is at the head of the list. Write a function that adds the two
# numbers and returns the sum as a linked list

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
