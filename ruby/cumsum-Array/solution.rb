require "test/unit/assertions"


module Enumerable
  # Returns a Array whose elements are the cumulative sums of the enum
  def cumsum
    inject([]) { |memo, x| memo.push( (memo.last || 0) + x ) }
  end
end

include Test::Unit::Assertions

assert_equal([].cumsum, [])
assert_equal([0].cumsum, [0])
assert_equal([10].cumsum, [10])
assert_equal([1,2,3].cumsum, [1,3,6])
assert_equal([1,-1,2].cumsum, [1,0,2])
