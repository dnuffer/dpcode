$:.unshift(*Dir[File.dirname(__FILE__)])
require 'make'

require 'rspec'

#TODO: Write tests for Make.execute()




if __FILE__ == $0
  #Make.driver(File.open("Makefile", "r") { |f| f.read }, ARGV[0])
  system 'rspec scratch.rb'
end
