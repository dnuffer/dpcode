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
from singly_linked_list import singly_linked_list

# TODO: You have two numbers represented by a linked list, where each node
# contains a single digit. The digits are stored in reverse order, such that
# 1's digit is at the head of the list. Write a function that adds the two
# numbers and returns the sum as a linked list
def add_lists(l1, l2):
  result = singly_linked_list()

  node1 = l1.head
  node2 = l2.head
  carry = 0
  while node1 or node2:
    if node1 and node2:
      result.append((node1.data + node2.data + carry) % 10)
      carry = (node1.data + node2.data + carry) / 10
    else:
      node = node1 if node1 else node2
      result.append((node.data + carry) % 10)
      carry = (node.data + carry) / 10

    node1 = node1.next_node if node1 else None
    node2 = node2.next_node if node2 else None


  if carry > 0:
    result.insert(0, carry)

  return result

if __name__ == '__main__':
  import doctest
  if doctest.testmod().failed > 0:
    import sys
    sys.exit(1)
