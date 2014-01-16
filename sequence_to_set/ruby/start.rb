require 'rspec'

require 'set'


describe "to_set" do
  it "makes a set out of an array" do
    s = to_set([1,2,3])
    s.size.should == 3
    s.to_a.sort.should == [1,2,3]
  end

  it "makes a set out of an enumerable" do
    s = to_set((1..10).each)
    s.size.should == 10
    s.to_a.sort.should == [1,2,3,4,5,6,7,8,9,10]
  end

  it "makes a set out of a range" do
    s = to_set((1..4))
    s.size.should == 4
    s.to_a.sort.should == [1,2,3,4]
  end
end

if $0 == __FILE__
  system "rspec #{$0}"
end

