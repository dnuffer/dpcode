$:.unshift(*Dir[File.dirname(__FILE__)])
if File.exist?(File.dirname(__FILE__) + "/scratch.rb")
  require 'scratch'
else
  require 'solution'
end

require 'rspec'

module Make
  describe "need_to_build" do
    context "target file doesn't exist" do
      before { File.should_receive(:exist?).with("target").and_return false }
      it "returns true if file doesn't exist" do
        Make.need_to_build([], "target").should == true
      end
    end

    context "target file exists" do
      before { 
        File.should_receive(:exist?).with("target").and_return true 
        File.should_receive(:mtime).with("target").once.and_return Time.new(2012)
      }
      it "returns true if one dependency is newer" do
        File.should_receive(:mtime).with("d1").once.and_return Time.new(2013)
        Make.need_to_build(["d1"], "target").should == true
      end
      it "returns true if one dependency is same mtime" do
        File.should_receive(:mtime).with("d1").once.and_return Time.new(2012)
        Make.need_to_build(["d1"], "target").should == true
      end
      it "returns true if one dependency is same mtime" do
        File.stub(:mtime).with("d1").and_return Time.new(2012)
        File.stub(:mtime).with("d2").and_return Time.new(2000)
        Make.need_to_build(["d1", "d2"], "target").should == true
      end
      it "returns false if one dependency is older" do
        File.stub(:mtime).with("d1").and_return Time.new(2000)
        Make.need_to_build(["d1"], "target").should == false
      end
      it "returns false if two dependencies are older" do
        File.stub(:mtime).with("d1").and_return Time.new(2000)
        File.stub(:mtime).with("d2").and_return Time.new(2000)
        Make.need_to_build(["d1", "d2"], "target").should == false
      end
    end
  end

  describe "using rules_hash" do
    let(:rules) { 
      [
        {:target=>"target", :prerequisites=>["d1", "d2"], :commands=>["c1", "c2"], :built=>false},
        {:target=>"d1", :prerequisites=>[], :commands=>["d1c1", "d1c2"], :built=>false},
        {:target=>"d2", :prerequisites=>[], :commands=>["d2c1", "d2c2"], :built=>false},
      ] 
    }
    let(:rules_hash) { Hash[rules.map { |x| [x[:target], x] }] }
    let(:goal_rule) { rules_hash["target"][:target] }

    describe "execute" do
      it "makes a hash and calls build_target" do
        Make.should_receive(:build_target).with(rules_hash, rules_hash[goal_rule])
        Make.execute(rules, "target")
      end
      it "makes a hash and calls build_target with default" do
        Make.should_receive(:build_target).with(rules_hash, rules_hash[goal_rule])
        Make.execute(rules)
      end
    end

    describe "build_target" do
      it "returns if goal[:built] is true" do
        rules_hash[goal_rule][:built] = true
        Make.build_target(rules_hash, rules_hash[goal_rule])
        Make.should_not_receive(:system)
      end
      it "returns if need_to_build returns false" do
        Make.stub(:need_to_build).and_return false
        Make.build_target(rules_hash, rules_hash[goal_rule])
        Make.should_not_receive(:system)
      end

      context "target is older than dependencies" do
        before do
          Make.stub(:need_to_build).with(["d1", "d2"], "target").and_return true
          Make.stub(:need_to_build).with([], "d1").and_return false
          Make.stub(:need_to_build).with([], "d2").and_return false
        end

        it "marks goal[:built] to true, and runs system for all commands" do
          Make.should_receive(:system).with("c1").ordered.once.and_return true
          Make.should_receive(:system).with("c2").ordered.once.and_return true
          Make.build_target(rules_hash, rules_hash[goal_rule])
          rules_hash[goal_rule][:built].should == true
        end
      end

      context "all need to build" do
        before do
          Make.stub(:need_to_build).with(["d1", "d2"], "target").and_return true
          Make.stub(:need_to_build).with([], "d1").and_return true
          Make.stub(:need_to_build).with([], "d2").and_return true
        end

        it "runs all commands in correct order" do
          Make.should_receive(:system).with("d1c1").ordered.once.and_return true
          Make.should_receive(:system).with("d1c2").ordered.once.and_return true
          Make.should_receive(:system).with("d2c1").ordered.once.and_return true
          Make.should_receive(:system).with("d2c2").ordered.once.and_return true
          Make.should_receive(:system).with("c1").ordered.once.and_return true
          Make.should_receive(:system).with("c2").ordered.once.and_return true
          Make.build_target(rules_hash, rules_hash[goal_rule])
          rules_hash[goal_rule][:built].should == true
        end

      end
    end
  end

end

