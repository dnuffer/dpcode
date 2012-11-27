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
sys.path.append('../singly_linked_list_delete')

from solution import singly_linked_list

def remove_duplicates(sll):
  seen_data = set()
  node = sll
  prev = None
  while node != None:
    if node.data in seen_data:
      prev.next = node.next
    else:
      seen_data.add(node.data)
      prev = node
    node = node.next
  return sll
  

if __name__ == '__main__':
  import doctest
  if doctest.testmod().failed > 0:
    import sys
    sys.exit(1)
