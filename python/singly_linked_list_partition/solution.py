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
sys.path.insert(0, '../singly_linked_list_delete')

from solution import singly_linked_list

#TODO: Write code to partition a linked list around a value x, such that all
# nodes less than x come before all nodes greater than or equal to x.
def partition(sll, value):
  low = None
  low_head = None
  high = None
  high_head = None
  node = sll
  while node != None:
    next = node.next
    node.next = None
    if node.data < value:
      if low:
        low.next = node
        low = low.next
      else:
        low_head = low = node
    else:
      if high:
        high.next = node
        high = high.next
      else:
        high_head = high = node

    node = next

  if low:
    low.next = high_head
    return low_head
  else:
    return high_head

if __name__ == '__main__':
  import doctest
  if doctest.testmod().failed > 0:
    import sys
    sys.exit(1)
