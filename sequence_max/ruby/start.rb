if __FILE__ == $0
  exit 1 unless system "rspec #{__FILE__}"
end

require 'rspec'


describe "max" do
  it "returns max of 1,2,3" do
    max([1,2,3]).should == 3
  end
  it "returns max of [99]" do
    max([99]).should == 99
  end
end
