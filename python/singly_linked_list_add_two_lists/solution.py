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
sys.path.insert(0, '../singly_linked_list_delete')

from solution import singly_linked_list

# TODO: You have two numbers represented by a linked list, where each node
# contains a single digit. The digits are stored in reverse order, such that
# 1's digit is at the head of the list. Write a function that adds the two
# numbers and returns the sum as a linked list

def append(head, tail, data):
  if tail == None:
    head = tail = singly_linked_list([data])
  else:
    tail.next = singly_linked_list([data])
    tail = tail.next
  return (head, tail)
  
def add_lists(l1, l2):
  carry = 0
  node1 = l1
  node2 = l2
  answer = None
  answer_tail = None
  while node1 != None or node2 != None:
    if node1 != None and node2 != None:
      answer, answer_tail = append(answer, answer_tail, (node1.data + node2.data) % 10 + carry)
      carry = (node1.data + node2.data) / 10
    else:
      node = node1 or node2
      answer, answer_tail = append(answer, answer_tail, node.data % 10 + carry)
      carry = 0
      
    if node1 != None:
      node1 = node1.next
    if node2 != None:
      node2 = node2.next

  return answer

if __name__ == '__main__':
  import doctest
  if doctest.testmod().failed > 0:
    import sys
    sys.exit(1)
