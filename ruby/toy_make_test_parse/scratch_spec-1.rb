$:.unshift(*Dir[File.dirname(__FILE__)])
if File.exist?(File.dirname(__FILE__) + "/scratch.rb")
  require 'scratch'
else
  require 'solution'
end

require 'rspec'

describe "Make::parse()" do
  it "returns empty array for empty input" do
    Make.parse("").should == []
  end

  it "parses single target" do
    Make.parse("target:").should == [{ :target => "target", :prerequisites => [], :commands => [], :built => false }]
  end

  it "parses dependencies" do
    Make.parse("target: dep1 dep2").should == [{ :target => "target", :prerequisites => ["dep1", "dep2"], :commands => [], :built => false }]
  end

  it "parses commands" do
    Make.parse("target:\n\tc1\n\tc2").should == [{ :target => "target", :prerequisites => [], :commands => ["c1", "c2"], :built => false }]
  end

  it "parses dependencies and commands" do
    Make.parse("target: d1\n\tc1\n\tc2").should == [{ :target => "target", :prerequisites => ["d1"], :commands => ["c1", "c2"], :built => false }]
  end

  it "parses multiple rules" do
    Make.parse(
"target: d1
\tc1
\tc2
t2: d22 d23
\tct21
\tct22
t3:
"
              ).should == [
                            { :target => "target", :prerequisites => ["d1"], :commands => ["c1", "c2"], :built => false },
                            { :target => "t2", :prerequisites => ["d22", "d23"], :commands => ["ct21", "ct22"], :built => false },
                            { :target => "t3", :prerequisites => [], :commands => [], :built => false },
                          ]
  end

  it "handles empty space between rules" do
    Make.parse("t1:\n\n\n\nt2:").should ==  [
                            { :target => "t1", :prerequisites => [], :commands => [], :built => false },
                            { :target => "t2", :prerequisites => [], :commands => [], :built => false },
                                            ]
  end
end
