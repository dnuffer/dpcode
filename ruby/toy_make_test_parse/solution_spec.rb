$:.unshift(*Dir[File.dirname(__FILE__)])
if File.exist?(File.dirname(__FILE__) + "/scratch.rb")
  require 'scratch'
else
  require 'solution'
end

require 'rspec'

module Make
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

      it "returns true if target is newer than any dependency" do
        File.stub(:mtime).with("target").and_return Time.new(2012)
        File.stub(:mtime).with("dependency1").and_return Time.new(2013)
        File.stub(:mtime).with("dependency2").and_return Time.new(2013)
        File.stub(:mtime).with("dependency3").and_return Time.new(2011)
        Make.need_to_build(["dependency1", "dependency2", "dependency3"], "target").should == true
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
          Make.should_receive(:system).with("command1").ordered.once.and_return(true)
          Make.should_receive(:system).with("command2").ordered.once.and_return(true)
          Make.build_target(rules_hash, target)
        end

        pending "somehow the state is messed up and this tests works fine by itself but won't play nice with others" do
          it "raises StandardError if command fails" do
            Make.should_receive(:system).with("command1").once.and_return(false)
            Make.should_not_receive(:system).with("command2")
            lambda { Make.build_target(rules_hash, target) }.should raise_error(StandardError)
          end
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
          Make.should_receive(:system).with("command2").ordered.once.and_return(true)
          Make.should_receive(:system).with("command1").ordered.once.and_return(true)
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
    #TODO: Add a test about command failure
  end
end

