require 'test/unit/assertions'

class Array
  def sample1(n, pdf = nil)
    if pdf
      max_prob = pdf.max
    else
      pdf = Array.new(size, 1.0 / size)
      max_prob = 1.0 / size
    end

    index = (rand * size).to_i
    beta = 0.0

    Array.new(n) do
      beta += rand * 2.0 * max_prob
      while beta > pdf[index]
        beta -= pdf[index]
        index = (index + 1) % size
      end
      self[index]
    end
  end

  def sample2(n, pdf = nil)
    pdf ||= Array.new(size, 1.0 / size)

    cdf = pdf.inject([0]) do |c, a|
      c << a + c.last
    end

    Array.new(n) do
      r = rand

      self[[size, cdf.rindex{|x| x <= r}].min]
    end
  end

end

include Test::Unit::Assertions

num_samples = 3000
min = 1
max = 10
samples = (min..max).to_a.sample(num_samples)
assert_equal(samples.size, num_samples)
assert(samples.min >= min)
assert(samples.max <= max)


(min..max).each do |i|
  pdf = Array.new(max, 0.0)
  pdf[i-1] = 1.0
  samples = (min..max).to_a.sample(num_samples, pdf)
  assert_equal(samples.size, num_samples)
  assert_equal(samples.min, i)
  assert_equal(samples.max, i)
end

(min..max-1).each do |i|
  pdf = Array.new(max, 0.0)
  pdf[i-1] = 0.5
  pdf[i] = 0.5
  samples = (min..max).to_a.sample(num_samples, pdf)
  assert_equal(samples.size, num_samples)
  assert_equal(samples.min, i)
  assert_equal(samples.max, i+1)
end


puts "All good!"
