$:.unshift(*Dir[File.dirname(__FILE__)])
if File.exist?(File.dirname(__FILE__) + "/scratch.rb")
  require 'scratch'
else
  require 'solution'
end

require 'rspec'

describe Make do

  it "parses one target" do
    Make.parse("t:").should == [{:target => "t", :prerequisites => [], :commands => [], :built => false }]
  end

  it "parses dependencies" do
    Make.parse("t: d1 d2").should == [{:target => "t", :prerequisites => ["d1", "d2"], :commands => [], :built => false }]
  end

  it "parses commands" do
    Make.parse("t: d1 d2\n\tc1\n\tc2").should == [{:target => "t", :prerequisites => ["d1", "d2"], :commands => ["c1", "c2"], :built => false }]
  end

  context "multiple rules" do
    let(:expected) {
      [
        {:target => "t", :prerequisites => ["d1", "d2"], :commands => ["c1", "c2"], :built => false },
        {:target => "t2", :prerequisites => ["2d1", "2d2"], :commands => ["2c1", "2c2"], :built => false },
      ]
    }

    it "parses multiple rules" do
      Make.parse("t: d1 d2\n\tc1\n\tc2\nt2: 2d1 2d2\n\t2c1\n\t2c2").should == expected
    end

    it "ignores empty space" do
      Make.parse("t: d1 d2\n\tc1\n\tc2\n\n\nt2: 2d1 2d2\n\t2c1\n\t2c2").should == expected
    end
  end

end
