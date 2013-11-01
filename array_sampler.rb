class ArraySampler
  def initialize(events_and_weights)
    @events = events_and_weights.reduce([]) { |memo, obj| memo += [obj[0]] * obj[1] }
  end

  def sample
    return @events[rand(@events.size)]
  end
end

if __FILE__ == $0
  events_and_weights =
  {
      "1" => 1,
      "2" => 2,
      "10" => 10,
  }

  ds = ArraySampler.new(events_and_weights)
  results = Hash.new(0)
  130000.times { results[ds.sample] += 1 }
  puts results.inspect

  events_and_weights =
  {
  }
  100.times { |i|
    events_and_weights[i] = 1
  }

  ds = ArraySampler.new(events_and_weights)
  results = Hash.new(0)
  10000000.times { results[ds.sample] += 1 }
  puts results.inspect

  events_and_weights =
  {
    "python" => 3,
  }
  ds = ArraySampler.new(events_and_weights)
  results = Hash.new(0)
  130000.times { results[ds.sample] += 1 }
  puts results.inspect

end

