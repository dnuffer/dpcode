"""
>>> l=singly_linked_list()
>>> l.data = 10
>>> l.data
10
>>> l.next == None
True
>>> l.append(20)
>>> l.next.data
20
>>> l.next.next == None
True

"""

# TODO: Implement a singly-linked list with next, data, and append()
class singly_linked_list:
  def __init__(self):
    self.data = None
    self.next = None

  def append(self, data):
    cur = self
    while cur.next != None:
      cur = cur.next
    cur.next = singly_linked_list()
    cur.next.data = data
    
			

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
