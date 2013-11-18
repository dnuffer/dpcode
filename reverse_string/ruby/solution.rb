
if __FILE__ == $0
  exit 1 unless system "rspec #{__FILE__}"
end

def reverse(s)
  s.reverse
end

require 'rspec'
describe "reverse" do
  it "reverses abc" do
    reverse("abc").should == "cba"
  end
  it "reverses a" do
    reverse("a").should == "a"
  end
  it "reverses empty" do
    reverse("").should == ""
  end
end
