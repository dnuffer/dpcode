def consumer(func):
  def wrapper(*args,**kw):
    gen = func(*args, **kw)
    gen.next()
    return gen
  wrapper.__name__ = func.__name__
  wrapper.__dict__ = func.__dict__
  wrapper.__doc__  = func.__doc__
  return wrapper

@consumer
def feed_sequence(destination):
  input_queue = _queue.Queue()
  #def input_seq():

def summer(input_seq):
  """
  pass a sequence of two-element sequences.
  returns a generator which returns the sum of the second item of each input element
  """
  total = 0
  for x in input_seq:
    total += x
  yield total

#print summer(xrange(4)).next()
def add1(input_seq):
  for x in input_seq:
    yield x+1

def make_gen():
  yield
  print("1")
  val = yield
  print("2: val = %s" % val)
  while True:
    print("3: val = %s" % val)
    val = yield val

def make_f():
  in_gen = make_gen()
  in_gen.send(None)
  out_gen = add1(in_gen)
  def wrapper(x):
    print("f1: x = %s" % x)
    in_gen.send(x)
    return out_gen.next()
  return wrapper

f = make_f()

for x in range(4):
  print f(x)
