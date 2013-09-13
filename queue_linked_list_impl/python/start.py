from should_dsl import should, should_not

# TODO: Write Queue with empty(), push_back() and pop_front()

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
