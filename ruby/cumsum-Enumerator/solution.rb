require "test/unit/assertions"


module Enumerable
  # Returns a lazy enumerator whose elements are the cumulative sums of the enum
  def cumsum
    Enumerator.new do |yielder|
      total = 0
      self.each do |val|
        total += val
        yielder.yield(total)
      end
    end
  end
end

include Test::Unit::Assertions

assert_equal([].cumsum.to_a, [])
assert_equal([0].cumsum.to_a, [0])
assert_equal([10].cumsum.to_a, [10])
assert_equal([1,2,3].cumsum.to_a, [1,3,6])
assert_equal([1,-1,2].cumsum.to_a, [1,0,2])
