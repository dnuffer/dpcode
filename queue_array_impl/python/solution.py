"""
>>> q = Queue()
>>> q.empty()
True
>>> q.push_back(1)
>>> q.empty()
False
>>> q.pop_front()
1
>>> q.empty()
True
>>> q.push_back(2)
>>> q.push_back(3)
>>> q.push_back(4)
>>> q.empty()
False
>>> q.pop_front()
2
>>> q.pop_front()
3
>>> q.pop_front()
4
>>> q.empty()
True
>>> xin = 0
>>> expect_out = 0
>>> for x in xrange(1, 100):
...   for y in xrange(x):
...     q.push_back(xin)
...     xin += 1
...   xout = q.pop_front()
...   if xout != expect_out:
...     print "Failed: got %d, expected %d" % (xout, expect_out)
...     break
...   expect_out += 1
>>> while not q.empty():
...   xout = q.pop_front()
...   if xout != expect_out:
...     print "Failed: got %d, expected %d" % (xout, expect_out)
...     break
...   expect_out += 1
"""

class Queue:
  def __init__(self):
    self.data = []

  def empty(self):
    return len(self.data) == 0

  def push_back(self, item):
    self.data.append(item)

  def pop_front(self):
    return self.data.pop(0)

if __name__ == "__main__":
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result

