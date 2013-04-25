$:.unshift(*Dir[File.dirname(__FILE__)])
if File.exist?(File.dirname(__FILE__) + "/scratch.rb")
  require 'scratch'
else
  require 'solution'
end

require 'rspec'

#TODO: Write tests for Foo.xy that validate the order

module Foo
  describe 'xy' do
    it 'should call x then y' do
      Foo.should_receive(:x).ordered
      Foo.should_receive(:y).ordered
      Foo.xy
    end
  end
end
