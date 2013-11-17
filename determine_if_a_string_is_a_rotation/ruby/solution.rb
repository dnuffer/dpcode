
if __FILE__ == $0
  exit 1 unless system "rspec #{__FILE__}"
end

def is_rotation(s1, s2)
  return false unless s1.length == s2.length
  return (s1 + s1)[s2] != nil
end


require 'rspec'
describe "is_rotation" do
  it "returns true for the same" do
    is_rotation("abc", "abc").should == true
  end

  it "returns true for empty" do
    is_rotation("", "").should == true
  end

  it "returns false for s2 empty, s1 not" do
    is_rotation("1", "").should == false
  end

  it "returns true for rotation" do
    is_rotation("abc", "bca").should == true
  end

  it "returns false if different lengths" do
    is_rotation("abc", "ab").should == false
    is_rotation("ab", "abc").should == false
  end

  it "returns false if reversed" do
    is_rotation("abc", "cba").should == false
  end

end
