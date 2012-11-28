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
sys.path.insert(0, '../singly_linked_list_delete')

from solution import singly_linked_list

def remove_duplicates(sll):
  node = sll
  while node != None:
    to_remove = node.data
    prev = node
    node2 = node.next
    while node2 != None:
      if node2.data == to_remove:
        prev.next = node2.next
      else:
        prev = node2
      node2 = node2.next
    node = node.next
    
  return sll
  

if __name__ == '__main__':
  import doctest
  if doctest.testmod().failed > 0:
    import sys
    sys.exit(1)
