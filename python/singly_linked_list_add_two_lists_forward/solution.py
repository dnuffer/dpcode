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

import sys
sys.path.insert(0, '../singly_linked_list_complete')

from singly_linked_list import singly_linked_list, singly_linked_list_node

# TODO: You have two numbers represented by a linked list, where each node
# contains a single digit. The digits are stored in forward order, such that
# 1's digit is at the tail of the list. Write a function that adds the two
# numbers and returns the sum as a linked list in forward order
def pad_with_zeros(l, num_zeros):
  for i in xrange(num_zeros):
    l.insert(0, 0)
  return l

def add_lists(l1, l2):
  len1 = len(l1)
  len2 = len(l2)
  maxlen = max([len1, len2])
  l1 = pad_with_zeros(l1, maxlen - len1)
  l2 = pad_with_zeros(l2, maxlen - len2)
  result_tail, carry = add_lists_same_length(l1.head, l2.head)
  if carry > 0:
    result_head = singly_linked_list_node(carry, result_tail)
  else:
    result_head = result_tail

  result = singly_linked_list()
  result.append_node(result_head)
  return result

def add_lists_same_length(node1, node2):
  # recursion termination, empty list with 0 carry
  if not node1 or not node2:
    return (None, 0)

  result_tail, carry = add_lists_same_length(node1.next_node, node2.next_node)
  return (singly_linked_list_node((node1.data + node2.data + carry) % 10, result_tail), (node1.data + node2.data + carry) / 10)
  

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
