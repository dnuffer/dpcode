require 'optparse'

options = OptionParser.new do |o|
  o.banner  = "Usage: solution.rb [options]"
  o.on('-n', '--name NAME') { |name| $name = name }
  o.on_tail('--help') { puts o; exit }
end

begin
  options.parse! 
rescue OptionParser::ParseError => e
  puts e
  puts options
  exit 1
end

puts "Hello, #{$name}"
