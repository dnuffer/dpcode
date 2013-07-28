require 'optparse'

OptionParser.new do |o|
  o.on('--name NAME') { |name| $name = name }
  o.on('--help') { puts o; exit }
  o.parse!
end

puts "Hello, #{$name}"
