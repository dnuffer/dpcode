require 'rspec'

if __FILE__ == $0
  exit 1 unless system "rspec #{__FILE__}"
end

def escape_spaces_for_url(s)
  s[" "] = "%20"
  s
end

describe "escape_spaces_for_url" do
  it "works" do
    escape_spaces_for_url("Hello dan").should == "Hello%20dan"
  end
end
