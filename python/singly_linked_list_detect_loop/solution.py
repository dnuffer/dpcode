"""
>>> print find_loop(singly_linked_list())
None
>>> print find_loop(singly_linked_list([1]))
None
>>> print find_loop(singly_linked_list([1, 2]))
None
>>> l = singly_linked_list([1])
>>> l.head.next_node = l.head
>>> find_loop(l) == l.head
True
>>> l = singly_linked_list([1, 2])
>>> l.head.next_node = l.head
>>> find_loop(l) == l.head
True
>>> l = singly_linked_list([1, 2])
>>> l.head.next_node.next_node = l.head
>>> find_loop(l) == l.head
True
>>> l = singly_linked_list([1, 2])
>>> l.head.next_node.next_node = l.head.next_node
>>> find_loop(l) == l.head.next_node
True
>>> l = singly_linked_list([1, 2, 3])
>>> l.head.next_node.next_node.next_node = l.head.next_node
>>> find_loop(l) == l.head.next_node
True
"""

import sys
sys.path.insert(0, '../singly_linked_list_complete')

from singly_linked_list import singly_linked_list, singly_linked_list_node

# TODO: write a function that returns None if the list is good (i.e. no loops)
# and that returns the node at the beginning of the loop if there is a loop
def find_loop(l):
  fast = l.head
  slow = l.head
  while fast and fast.next_node:
    slow = slow.next_node
    fast = fast.next_node.next_node
    if fast == slow:
      break

  # No loop because fast hit the end of the list
  if not fast or not fast.next_node:
    return None

  from_collision = fast
  from_head = l.head
  while from_collision != from_head:
    from_collision = from_collision.next_node
    from_head = from_head.next_node

  return from_collision

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
