class singly_linked_list_node:
  def __init__(self, data = None, next_node = None):
    self.data = data
    self.next_node = next_node

class singly_linked_list:
  def __init__(self, items = None):
    self.head = None
    self.tail = None

    if items:
      for item in items:
        self.append(item)

  def append(self, data):
    """
    >>> l=singly_linked_list()
    >>> print l.append(0)
    [0]
    >>> print l.append(None)
    [0 -> None]
    >>> print l.append("a")
    [0 -> None -> a]
    """
    return self.append_node(singly_linked_list_node(data))
    
  def append_node(self, node):
    """
    >>> l1=singly_linked_list([1,2])
    >>> l2=singly_linked_list([3,4])
    >>> print l1.append_node(l2.head)
    [1 -> 2 -> 3 -> 4]
    >>> print l1.append(5)
    [1 -> 2 -> 3 -> 4 -> 5]
    """
    if self.tail:
      self.tail.next_node = node
    else:
      self.head = self.tail = node

    while self.tail.next_node:
      self.tail = self.tail.next_node

    return self

  def insert(self, position, data):
    """
    >>> l1 = singly_linked_list()
    >>> print l1.insert(0, 'begin')
    [begin]
    >>> print l1.insert(1, 'second')
    [begin -> second]
    >>> print l1.insert(0, 'before begin')
    [before begin -> begin -> second]
    >>> print l1.append('new end')
    [before begin -> begin -> second -> new end]
    """
    if position == 0 and not self.tail:
      self.append(data)
    else:
      node = self.head
      prev = None
      while node and position > 0:
        prev = node
        node = node.next_node
        position -= 1

      if prev:
        prev.next_node = singly_linked_list_node(data)
        prev.next_node.next_node = node
        if prev == self.tail:
          self.tail = prev.next_node
      else:
        old_head = self.head
        self.head = singly_linked_list_node(data)
        self.head.next_node = old_head
    
    return self

  def delete(self, data):
    """
    >>> l=singly_linked_list([10, 20])
    >>> print l.delete(10)
    [20]
    >>> print l.delete(10)
    [20]
    >>> print l.delete(20)
    []
    >>> print l.delete(1)
    []
    >>> l=singly_linked_list([1, 2, 3])
    >>> print l.delete(1)
    [2 -> 3]
    >>> l=singly_linked_list([1, 2, 3])
    >>> print l.delete(2)
    [1 -> 3]
    >>> l=singly_linked_list([1, 2, 3])
    >>> print l.delete(3)
    [1 -> 2]
    >>> print l.delete(2)
    [1]
    >>> print l.delete(1)
    []
    >>> print l.delete(None)
    []
    """
    if not self.head:
      return self

    if self.head.data == data:
      if self.head == self.tail:
        self.head = self.tail = None
      else:
        self.head = self.head.next_node
      return self
			
    node = self.head

    while node.next_node:
      if node.next_node.data == data:
        if node.next_node.next_node == None:
          self.tail = node
        node.next_node = node.next_node.next_node
        return self

      node = node.next_node

    return self

  def __len__(self):
    """
    >>> len(singly_linked_list([]))
    0
    >>> len(singly_linked_list([1]))
    1
    >>> len(singly_linked_list(range(10)))
    10
    """
    length = 0
    node = self.head
    while node:
      length += 1
      node = node.next_node
    return length

  def __getitem__(self, k):
    """
    >>> sll = singly_linked_list([1])
    >>> print sll[0]
    1
    >>> sll = singly_linked_list([1, 2, 3])
    >>> print sll[0]
    1
    >>> print sll[1]
    2
    >>> print sll[2]
    3
    >>> sll = singly_linked_list(["A", "b", "C"])
    >>> sll[0]
    'A'
    >>> sll[-1]
    'C'
    >>> sll[-2]
    'b'
    >>> sll[-3]
    'A'
    >>> sll[-4]
    Traceback (most recent call last):
      ...
    IndexError: list index out of range
    >>> sll[10]
    Traceback (most recent call last):
      ...
    IndexError: list index out of range
    """
    if k >= 0:
      node = self.head
      while node != None and k > 0:
        node = node.next_node
        k -= 1
      if k > 0:
        raise IndexError("list index out of range")
      return node.data
    else:
      length = len(self)
      if k * -1 > length:
        raise IndexError("list index out of range")
      return self[length + k]

  def __iter__(self):
    node = self.head
    while node != None:
      yield node
      node = node.next_node
    return

  def __str__(self):
    """
    >>> print singly_linked_list([0, None, "a"])
    [0 -> None -> a]
    """
    return '[%s]' % ' -> '.join([str(node.data) for node in self])

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result

