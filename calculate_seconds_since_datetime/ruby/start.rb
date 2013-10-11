require "test/unit/assertions"
require 'date'
require 'tzinfo'


# TODO write datetime_difference_in_seconds

print "What is your birthday? "
birthday = gets.strip


print "What Time Zone were you born in? "
time_zone = gets.strip

# TODO calculate the difference between comparison_time and the given birthday


comparison_time = Time.at(1380633042)
print "On #{comparison_time.iso8601} you were #{datetime_difference_in_seconds(birth_time, comparison_time)} seconds old\n"


include Test::Unit::Assertions

assert_equal(datetime_difference_in_seconds(DateTime.parse("1976-04-19T06:07:08-06:00"), DateTime.parse("2013-04-17T08:07:42-06:00")), 1167444034)
assert_equal(datetime_difference_in_seconds(DateTime.parse("1976-04-19T06:07:08-06:00"), DateTime.parse("2013-04-17T08:07:42-07:00")), 1167447634)
