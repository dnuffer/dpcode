"""
>>> sll1 = singly_linked_list([1])
>>> sll2 = singly_linked_list([2])
>>> print add_lists(sll1, sll2)
[3]
>>> sll1 = singly_linked_list([1, 2])
>>> sll2 = singly_linked_list([3, 4])
>>> print add_lists(sll1, sll2)
[4 -> 6]
>>> sll1 = singly_linked_list([6, 1, 7])
>>> sll2 = singly_linked_list([2, 9, 5])
>>> print add_lists(sll1, sll2)
[9 -> 1 -> 2]
>>> sll1 = singly_linked_list([4, 6, 1, 7])
>>> sll2 = singly_linked_list([2, 9, 5])
>>> print add_lists(sll1, sll2)
[4 -> 9 -> 1 -> 2]
>>> sll1 = singly_linked_list([6, 1, 7])
>>> sll2 = singly_linked_list([4, 2, 9, 5])
>>> print add_lists(sll1, sll2)
[4 -> 9 -> 1 -> 2]
>>> sll1 = singly_linked_list([6, 1, 7])
>>> sll2 = singly_linked_list([6, 9, 5])
>>> print add_lists(sll1, sll2)
[1 -> 3 -> 1 -> 2]
"""

from singly_linked_list import singly_linked_list, singly_linked_list_node

# TODO: You have two numbers represented by a linked list, where each node
# contains a single digit. The digits are stored in forward order, such that
# 1's digit is at the tail of the list. Write a function that adds the two
# numbers and returns the sum as a linked list in forward order
# e.g. 1->2 + 3->4 = 4->6

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
