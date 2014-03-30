if __FILE__ == $1
  exit 1 unless system "rspec #{__FILE__}"
end


require 'rspec'

describe "sqrt_newton" do
  it "calculates the sqrt of 4" do
    sqrt_newton(4).should == 2
  end
  it "calculates the sqrt of 1" do
    sqrt_newton(1).should == 1
  end
  it "calculates the sqrt of 2" do
    sqrt_newton(2).should == 1.416
  end
end
