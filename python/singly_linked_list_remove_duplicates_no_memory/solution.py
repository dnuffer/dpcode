"""
>>> sll = singly_linked_list([1])
>>> print remove_duplicates(sll)
[1]
>>> sll = singly_linked_list([1, 1])
>>> print remove_duplicates(sll)
[1]
>>> sll = singly_linked_list([1, 1, 1])
>>> print remove_duplicates(sll)
[1]
>>> sll = singly_linked_list([1, 1, 2])
>>> print remove_duplicates(sll)
[1 -> 2]
>>> sll = singly_linked_list([1, 2, 1])
>>> print remove_duplicates(sll)
[1 -> 2]
>>> sll = singly_linked_list([2, 1, 1])
>>> print remove_duplicates(sll)
[2 -> 1]
>>> sll = singly_linked_list(["A", "b", "A"])
>>> print remove_duplicates(sll)
[A -> b]
"""

import sys
sys.path.insert(0, '../singly_linked_list_complete')

from singly_linked_list import singly_linked_list

def remove_duplicates(sll):
  node = sll.head
  while node:
    to_remove = node.data
    prev = node
    node2 = node.next_node
    while node2:
      if node2.data == to_remove:
        prev.next_node = node2.next_node
      else:
        prev = node2
      node2 = node2.next_node
    node = node.next_node
    
  return sll
  

if __name__ == '__main__':
  import doctest
  if doctest.testmod().failed > 0:
    import sys
    sys.exit(1)
