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

# TODO: implement remove_duplicates which is passed a singly_linked_list, 
# removes the duplicate nodes without using any additional memory and then returns the list

if __name__ == '__main__':
  import doctest
  if doctest.testmod().failed > 0:
    import sys
    sys.exit(1)
