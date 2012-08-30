
class Result
  attr_accessor :space, :sample_count, :pdf, :sample_version, :time
  def initialize(space, sample_count, pdf, sample_version, time)
    self.space = space; self.sample_count = sample_count; self.pdf = pdf; self.sample_version = sample_version; self.time = time;
  end

  def time_per_sample
    time / sample_count
  end

end

