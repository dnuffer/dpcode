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

  describe "need_to_build" do
    it "returns true if target does not exist" do
      File.stub(:exist?).with("target").and_return false
      Make.need_to_build(["dependency"], "target").should == true
    end

    context "target exists" do
      before do
        File.stub(:exist?).with("target").and_return true
      end

      
      it "returns true if target is older than dependency" do
        File.stub(:mtime).with("target").and_return Time.new(2011)
        File.stub(:mtime).with("dependency").and_return Time.new(2012)
        Make.need_to_build(["dependency"], "target").should == true
      end

      it "returns true if target has same mtime as dependency" do
        File.stub(:mtime).with("target").and_return Time.new(2012)
        File.stub(:mtime).with("dependency").and_return Time.new(2012)
        Make.need_to_build(["dependency"], "target").should == true
      end

      it "returns false if target is newer than dependency" do
        File.stub(:mtime).with("target").and_return Time.new(2012)
        File.stub(:mtime).with("dependency").and_return Time.new(2011)
        Make.need_to_build(["dependency"], "target").should == false
      end
    end
  end

  describe "single rule, single command" do

    target = {:target => "target", :prerequisites => [], :commands => ["command1"], :built => false}
    rules = [target]
    rules_hash = Hash["target", target]

    describe "execute" do
      it "calls build_target" do
        Make.should_receive(:build_target).with(rules_hash, target).once
        Make.execute(rules, "target")
      end
    end

    context "target doesn't exist" do
      before do
        File.stub(:exist?).with("target").and_return false
      end

      describe "build_target" do
        it "executes commands to satisfy target" do
          Make.should_receive(:system).with("command1").once.and_return(true)
          Make.build_target(rules_hash, target)
        end
      end
    end

    context "target does exist" do
      before do
        File.stub(:exist?).with("target").and_return true
        File.stub(:mtime).with("target").and_return Time.new(2012)
      end

      describe "build_target" do
        it "executes commands to satisfy target" do
          Make.should_not_receive(:system).with("command1")
          Make.build_target(rules_hash, target)
        end
      end
    end
  end

  describe "single rule, two commands" do

    target = {:target => "target", :prerequisites => [], :commands => ["command1", "command2"], :built => false}
    rules_hash = Hash["target", target]

    context "target doesn't exist" do
      before do
        File.stub(:exist?).with("target").and_return false
      end

      describe "build_target" do
        it "executes commands to satisfy target" do
          Make.should_receive(:system).with("command1").once.and_return(true)
          Make.should_receive(:system).with("command2").once.and_return(true)
          Make.build_target(rules_hash, target)
        end
      end
    end
  end

  describe "two rules, one command" do

    target1 = {:target => "target1", :prerequisites => ["target2"], :commands => ["command1"], :built => false}
    target2 = {:target => "target2", :prerequisites => [], :commands => ["command2"], :built => false}
    rules_hash = Hash["target1", target1, "target2", target2]

    context "target doesn't exist" do
      before do
        File.stub(:exist?).with("target1").and_return false
        File.stub(:exist?).with("target2").and_return false
      end

      describe "build_target" do
        it "executes commands to satisfy target" do
          Make.should_receive(:system).with("command1").once.and_return(true)
          Make.should_receive(:system).with("command2").once.and_return(true)
          Make.build_target(rules_hash, target1)
        end
      end
    end
  end

  describe "two recursive rules, one command" do

    target1 = {:target => "target1", :prerequisites => ["target2"], :commands => ["command1"], :built => false}
    target2 = {:target => "target2", :prerequisites => ["target1"], :commands => ["command2"], :built => false}
    rules_hash = Hash["target1", target1, "target2", target2]

    context "target doesn't exist" do
      before do
        File.stub(:exist?).with("target1").and_return false
        File.stub(:exist?).with("target2").and_return false
      end

      describe "build_target" do
        it "executes commands to satisfy target" do
          Make.should_receive(:system).with("command1").once.and_return(true)
          Make.should_receive(:system).with("command2").once.and_return(true)
          Make.build_target(rules_hash, target1)
        end
      end
    end
  end
end

