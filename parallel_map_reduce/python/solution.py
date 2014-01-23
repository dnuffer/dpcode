"""
>>> count_chars((word for word in ["Hello", "world", "Dan", "is", "awesome"]))
2
"""

import pykka

class MessageWithSender:
  def __init__(self, sender_ref, sender_message):
    self.sender_ref = sender_ref
    self.sender_message = sender_message


class ReplyToMessage:
  def __init__(self, in_reply_to_msg):
    self.in_reply_to_msg = in_reply_to_msg


class MapDataMessage(ReplyToMessage):
  def __init__(self, data, in_reply_to_msg):
    super(MapDataMessage, self).__init__(in_reply_to_msg)
    self.data = data


class EOFMessage(ReplyToMessage):
  def __init__(self, in_reply_to_msg):
    super(EOFMessage, self).__init__(in_reply_to_msg)


class InputSource(pykka.ThreadingActor):
  def __init__(self, input_gen):
    self.input_gen = input_gen

  def on_receive(self, message):
    try:
      message.sender_actor.tell(MapDataMessage(input_gen.next(), message))
    except StopIteration:
      message.sender_actor.tell(EOFMessage(message))


class RequestData(MessageWithSender):
  def __init__(self, sender_actor, sender_message):
    super(RequestData, self).__init__(sender_actor, sender_message)


class StartMappingMessage(MessageWithSender):
  def __init__(self, sender_actor, sender_message, input_source_actor):
    super(StartMappingMessage, self).__init__(sender_actor, sender_message)
    self.input_source_actor = input_source_actor


class ReduceDataMessage(ReplyToMessage):
  def __init__(self, mapped_data, start_mapping_message):
    super(ReduceDataMessage, self).__init__(start_mapping_message)
    self.mapped_data = mapped_data


class Mapper(pykka.ThreadingActor):
  def __init__(self, mapper_func):
    super(Mapper, self).__init__()
    self.mapper_func = mapper_func
    

  def on_receive(self, message):
    # Message from a Reducer actor
    if isinstance(message, StartMappingMessage):
      message.source_actor.tell(RequestData(self.actor_ref, message))

    # Messages from the InputSource actor
    if isinstance(message, MapDataMessage):
      # unwrap the message that started this thread of actions
      start_mapping_message = message.in_reply_to_message.sender_message
      # first send the next request for more data, then process the data we've got
      start_mapping_message.input_source_actor.tell(RequestData(self.actor_ref, start_mapping_message))
      # now process the data and send the result to the reducer
      mapped_data = self.mapper_func(message.data)
      start_mapping_message.sender_actor.tell(ReduceDataMessage(mapped_data, start_mapping_message))
    elif isinstance(message, EOFMessage):
      # unwrap the message that started this thread of actions
      start_mapping_message = message.in_reply_to_message.sender_message
      start_mapping_message.sender_actor.tell(EOFMessage(start_mapping_message))
      self.stop()
    else:
      assert False


class StartReducingMessage(MessageWithSender):
  def __init__(self, sender_actor, sender_message, parallelism):
    super(StartReducingMessage, self).__init__(sender_actor, sender_message)
    self.parallelism = parallelism


class Reducer(pykka.ThreadingActor):
  def __init__(self, reducer_func):
    self.reducer_func = reducer_func
    self.data = []
    self.outstanding_mappers = 0

  def on_receive(self, message):
    # Message from the Sorter actor - start up the mappers
    if isinstance(message, StartReducingMessage):
      mappers = [Mapper(message.mapper_func) for x in xrange(message.parallelism)]

      for mapper in mappers:
        mapper.start()

      for mapper in mappers:
        mapper.tell(StartMappingMessage(self.actor_ref, message, message.input_source_actor))

      self.outstanding_mappers = message.parallelism

    # Message from the mapper actors
    if isinstance(message, ReduceDataMessage):
      self.data.append(message.mapped_data)

    if isinstance(message, EOFMessage):
      self.outstanding_mappers -= 1
      if self.outstanding_mappers == 0:
        # unwrap the message that started this thread of actions
        start_reducing_message = message.in_reply_to_message.sender_message
        for reduce_result in reducer_func(self.data):
          start_reducing_message.sender_actor.tell(SortDataMessage(reduce_result, start_reducing_message))
        start_reducing_message.sender_actor.tell(EOFMessage(start_reducing_message))

def Sorter(pykka.ThreadingActor):
  def __init__(self):
    pass

  def on_receive(self, message):
    reducer_actor.tell(ReduceDataMessage())


def OutputDestination(pykka.ThreadingActor):
  def __init__(self):
    pass

def map_reduce(input_gen, mapper_func, mapper_parallelism, reducer_func):
  dest = OutputDestination(input_gen, mapper_func, mapper_parallelism, reducer_func)

  


def count_chars(strings_gen):
  """
  pass a generator of a sequence of strings to be counted
  """
  counts = map_reduce(input_gen = strings_gen, 
      mapper_func = counter, 
      mapper_parallelism = 4, 
      reducer_func = summer)


def counter(in_str):
  """
  pass a sequence the first element will be read and a two-element tuple containing the
  element and the length of the element will be returned
  """
  return (in_str[0], len(in_str[0]))

def summer(input_seq):
  """
  pass a sequence of two-element sequences.
  returns a generator which returns the sum of the second item of each input element
  """
  total = 0
  for x in input_seq:
    total += x[1]
  yield total

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result

