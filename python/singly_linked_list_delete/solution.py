"""
>>> l=singly_linked_list([10, 20])
>>> n = l.next
>>> l2 = l.delete(10)
>>> n == l2
True
>>> l2.data
20
>>> l=singly_linked_list([1, 2, 3])
>>> l2=l.delete(1)
>>> l2.data
2
>>> l2.next.data
3
>>> l2.next.next == None
True
>>> l=singly_linked_list([1, 2, 3])
>>> l2=l.delete(2)
>>> l2.data
1
>>> l2.next.data
3
>>> l2.next.next == None
True
>>> l=singly_linked_list([1, 2, 3])
>>> l2=l.delete(3)
>>> l2.data
1
>>> l2.next.data
2
>>> l2.next.next == None
True
"""

class singly_linked_list:
  def __init__(self, items = None):
    self.data = None
    self.next = None

    if items:
      self.data = items[0]

      cur = self
      for item in items[1:]:
        cur.next = singly_linked_list()
        cur.next.data = item
        cur = cur.next

  def append(self, data):
    cur = self
    while cur.next != None:
      cur = cur.next
    cur.next = singly_linked_list()
    cur.next.data = data
    
# TODO: Implement delete(data) which removes the first node s.t. node.data == data
# and returns the new head of the list
  def delete(self, data):
    head = self
    
    if head.data == data:
      return head.next
			
    node = head

    while node.next:
      if node.next.data == data:
        node.next = node.next.next
        return head

      node = node.next

    return head

if __name__ == '__main__':
	import doctest
	if doctest.testmod().failed > 0:
		import sys
		sys.exit(1)
