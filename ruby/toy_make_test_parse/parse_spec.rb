$:.unshift(*Dir[File.dirname(__FILE__)])
if File.exist?(File.dirname(__FILE__) + "/scratch.rb")
  require 'scratch'
else
  require 'solution'
end

require 'rspec'

module Make
  describe "parse" do
    it "should parse empty" do
      Make.parse("").should == []
    end

    it "should parse a target with no dependencies or rules" do
      Make.parse("target:").should == [ {:target => "target", :prerequisites => [], :commands => [], :built => false } ]
    end

    it "should parse a target with one dependency and no rules" do
      Make.parse("target: dep").should == [ {:target => "target", :prerequisites => %w(dep), :commands => [],
                                             :built => false } ]
    end

    it "should parse a target with two dependencies and no rules" do
      Make.parse("target: dep1 dep2").should == [ {:target => "target", :prerequisites => %w(dep1 dep2),
                                                   :commands => [], :built => false } ]
    end

    it "should parse a target with no dependencies and a rule" do
      Make.parse(
%Q{target:
\trule}
                ).should ==
      [ {
          :target => "target",
          :prerequisites => [],
          :commands => %w(rule),
          :built => false
        } ]
    end

    it "should parse a target with dependencies and rules" do
      Make.parse(
%Q{target: dep1 dep2
\trule1
\trule2}
                ).should ==
      [ {
          :target => "target",
          :prerequisites => %w(dep1 dep2),
          :commands => %w(rule1 rule2),
          :built => false
        } ]
    end

    it "should parse multiple targets" do
      Make.parse(
%Q{target1:
target2: t2d1 t2d2

target3: t3d1
\tt3r1
\tt3r2}
                ).should ==
      [ {
          :target => "target1",
          :prerequisites => [ ],
          :commands => [ ],
          :built => false
        },
        {
          :target => "target2",
          :prerequisites => %w(t2d1 t2d2),
          :commands => [ ],
          :built => false
        },
        {
          :target => "target3",
          :prerequisites => %w(t3d1),
          :commands => %w(t3r1 t3r2),
          :built => false
        } ]
    end
  end

end

