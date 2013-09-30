require "test/unit/assertions"
require 'date'
require 'tzinfo'


def datetime_difference_in_seconds(first, second)
  return second.to_time.to_i - first.to_time.to_i
end

print "What is your birthday? "
birthday = gets.strip


print "What Time Zone were you born in? "
time_zone = gets.strip

tz = TZInfo::Timezone.get(time_zone)

birth_time = tz.local_to_utc(DateTime.parse(birthday))
print "Using birthday as: #{birth_time}\n"
utc_now = Time.now.utc

print "You are #{datetime_difference_in_seconds(birth_time, utc_now)} seconds old\n"


include Test::Unit::Assertions

assert_equal(datetime_difference_in_seconds(DateTime.parse("1976-04-19T06:07:08-06:00"), DateTime.parse("2013-04-17T08:07:42-06:00")), 1167444034)
assert_equal(datetime_difference_in_seconds(DateTime.parse("1976-04-19T06:07:08-06:00"), DateTime.parse("2013-04-17T08:07:42-07:00")), 1167447634)
