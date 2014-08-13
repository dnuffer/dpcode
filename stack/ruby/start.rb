if __FILE__ == $0
  exit(system "rspec #{$0}")
end


require 'rspec'

describe "Stack" do
  it "pushes and pops" do
    s = Stack.new
    expect(s.empty()) == true
    s.push 1
    expect(s.empty()) == false
    expect(s.pop()) == 1
    expect(s.empty()) == true
  end
end


