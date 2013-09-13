from should_dsl import should, should_not

class QueueNode:
  def __init__(self, next_node = None, data = None):
    self.next_node = next_node
    self.data = data

class Queue:
  def __init__(self):
    self.front = None
    self.back = None

  def empty(self):
    return self.front == None

  def push_back(self, data):
    if not self.front:
      self.back = QueueNode(data = data)
      self.front = self.back
    else:
      self.back.next_node = QueueNode(data = data)
      self.back = self.back.next_node

  def pop_front(self):
    result = self.front.data
    self.front = self.front.next_node
    return result

def test_queue():
  queue = Queue()
  queue.empty() |should| equal_to(True)

  queue.push_back(1)
  queue.push_back(2)
  queue.push_back(3)
  queue.empty() |should| equal_to(False)

  queue.pop_front() |should| equal_to(1)
  queue.pop_front() |should| equal_to(2)
  queue.pop_front() |should| equal_to(3)
  queue.empty() |should| equal_to(True)
  queue.push_back(4)
  queue.empty() |should| equal_to(False)
  queue.pop_front() |should| equal_to(4)

  in_cnt = 0
  out_cnt = 0
  for i in xrange(1, 50):
    for j in xrange(i):
      queue.push_back(in_cnt)
      in_cnt += 1

    queue.pop_front() |should| equal_to(out_cnt)

    out_cnt += 1

  while not queue.empty():
    queue.pop_front() |should| equal_to(out_cnt)
    out_cnt += 1

if __name__ == '__main__':
  test_queue()
  print "Success!"
