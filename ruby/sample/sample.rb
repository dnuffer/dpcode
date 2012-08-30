require 'test/unit/assertions'
require 'hitimes'
require 'yaml'

require 'result'
require 'pdf_gens'

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

class RandomGaussian
  def initialize(mean = 0.0, sd = 1.0, rng = lambda { Kernel.rand })
    @mean, @sd, @rng = mean, sd, rng
    @compute_next_pair = false
  end

  def rand
    if (@compute_next_pair = !@compute_next_pair)
      # Compute a pair of random values with normal distribution.
      # See http://en.wikipedia.org/wiki/Box-Muller_transform
      theta = 2 * Math::PI * @rng.call
      scale = @sd * Math.sqrt(-2 * Math.log(1 - @rng.call))
      @g1 = @mean + scale * Math.sin(theta)
      @g0 = @mean + scale * Math.cos(theta)
    else
      @g1
    end
  end
end

def gaussian_pdf(mean, sd, x)
  (1.0 / (sd * Math.sqrt(2 * Math::PI))) * Math.exp(-0.5 * (x - mean)**2 / sd**2)
end

def run_tests
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
end


def setup_perf_run(max, &pdfgen)
  [normalize(Array.new(max) { |i| yield max, i }), (1..max).to_a]
end

def perf_run_sample1(a, num_samples, pdf)
  a.sample1(num_samples, pdf)
end

def perf_run_sample2(a, num_samples, pdf)
  a.sample2(num_samples, pdf)
end

results = []

def normalize(a)
  sum = a.inject(0) { |a, x| a+x }
  a.map { |x| x/sum }
end


#pdf, a = setup_perf_run(1000, &uniform_gen)
#puts Benchmark.measure { perf_run_sample1(a, 1000000, pdf) }
#runs = 100
#Benchmark.bm do |x|
#  x.report { runs.times do; perf_run_sample1(a, 1000, pdf); end }
#  x.report { runs.times do; perf_run_sample2(a, 1000, pdf); end }
#end

# vary space from small to large (powers of 2?)
# vary samples from small to large (powers of 2?)
# pdf: uniform, all on one, gaussian, random
powers_of_2 = [2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,65536]
#powers_of_2 = [64,128,256,512,1024,2048,4096,8192,16384]
#powers_of_2 = [64,128,256,512,1024,2048,4096]

powers_of_2.each do |max|
  powers_of_2.each do |samples|
    PdfGens::GENS.each do |gen_name, gen|
      pdf, a = setup_perf_run(max, &gen)
      #puts "For max: #{max}, samples: #{samples}, gen: #{gen_name}"
      time = Hitimes::Interval.measure { perf_run_sample1(a, samples, pdf) }
      #puts "1: ", time.utime
      results.push(Result.new(max, samples, gen_name, 1, time))
      time = Hitimes::Interval.measure { perf_run_sample2(a, samples, pdf) }
      #puts "2: ", time.utime
      results.push(Result.new(max, samples, gen_name, 2, time))
    end
  end

end

File.open("results.yaml", "w") do |f|
  f.write(results.to_yaml)
end

