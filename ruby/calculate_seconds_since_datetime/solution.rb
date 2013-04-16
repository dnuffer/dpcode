require "test/unit/assertions"


def datetime_difference_in_seconds(first, second)
  return second.to_time.to_i - first.to_time.to_i
end

include Test::Unit::Assertions

assert_equal([].cumsum, [])
assert_equal([0].cumsum, [0])
assert_equal([10].cumsum, [10])
assert_equal([1,2,3].cumsum, [1,3,6])
assert_equal([1,-1,2].cumsum, [1,0,2])
