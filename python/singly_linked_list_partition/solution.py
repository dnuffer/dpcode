"""
>>> sll = singly_linked_list([1])
>>> print partition(sll, 0)
[1]
>>> sll = singly_linked_list([1])
>>> print partition(sll, 1)
[1]
>>> sll = singly_linked_list([1])
>>> print partition(sll, 2)
[1]
>>> sll = singly_linked_list([3, 2, 1])
>>> print partition(sll, 0)
[3 -> 2 -> 1]
>>> sll = singly_linked_list([3, 2, 1])
>>> print partition(sll, 1)
[3 -> 2 -> 1]
>>> sll = singly_linked_list([3, 2, 1])
>>> print partition(sll, 2)
[1 -> 3 -> 2]
>>> sll = singly_linked_list([3, 2, 1])
>>> print partition(sll, 3)
[2 -> 1 -> 3]
>>> sll = singly_linked_list([3, 2, 1])
>>> print partition(sll, 4)
[3 -> 2 -> 1]
"""

import sys
sys.path.insert(0, '../singly_linked_list_complete')

from singly_linked_list import singly_linked_list

#TODO: Write code to partition a linked list around a value x, such that all
# nodes less than x come before all nodes greater than or equal to x.
def partition(sll, x):
  upper = singly_linked_list()
  lower = singly_linked_list()
  node = sll.head
  while node:
    next_node = node.next_node
    node.next_node = None
    if node.data < x:
      lower.append_node(node)
    else:
      upper.append_node(node)
    node = next_node

  lower.append_node(upper.head)
  sll.head = lower.head
  return sll
      

if __name__ == '__main__':
  import doctest
  if doctest.testmod().failed > 0:
    import sys
    sys.exit(1)
