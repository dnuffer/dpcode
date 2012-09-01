$:.unshift(*Dir[File.dirname(__FILE__)])
if File.exist?(File.dirname(__FILE__) + "/scratch.rb")
  require 'scratch'
else
  require 'solution'
end

require 'rspec'

describe "Make" do
  let(:goal) { "target" }
  let(:rule1) { {:target => "target", :prerequisites => [], :commands => [], :built => false} }

  def make_rules_hash rules
    Hash[rules.map { |x| [x[:target], x] }]
  end

  describe "execute" do
    def setup_expectation rules
      rules_hash = make_rules_hash rules
      Make.should_receive(:build_target).with(rules_hash, rules_hash[goal])
    end

    it "calls build_target with hash and goal" do
      rules = [rule1]
      setup_expectation rules
      Make.execute(rules, goal)
    end

    it "uses first rule as default goal" do
      rules = [rule1,
               {:target => "t2", :prerequisites => [], :commands => [], :built => false}]
      setup_expectation rules
      Make.execute(rules)
    end
  end

  describe "build_target" do
    let(:rules_hash) { make_rules_hash [rule1] }
    it "returns if built already" do
      rule1[:built] = true
      Make.build_target rules_hash, rules_hash[goal]
      Make.should_not_receive :system
    end

    it "returns if need_to_build returns false" do
      Make.stub(:need_to_build).and_return false
      Make.build_target rules_hash, rules_hash[goal]
      Make.should_not_receive :system
    end

    it "sets :built = true" do
      Make.stub(:need_to_build).and_return true
      Make.build_target rules_hash, rules_hash[goal]
      rules_hash[goal][:built].should == true
    end

    context "rule with unmet dependencies" do
      let(:rule1) { {:target => "target", :prerequisites => ["d1", "d2"], :commands => ["c1", "c2"], :built => false} }
      before do
        Make.stub(:need_to_build).and_return true
      end
      it "doesn't call build_target for dependencies without rules" do
        Make.should_not_receive(:build_target).with(rules_hash, nil)
        Make.build_target rules_hash, rules_hash[goal]
      end

      it "executes commands" do
        Make.should_receive(:system).with("c1").ordered.and_return true
        Make.should_receive(:system).with("c2").ordered.and_return true
        Make.build_target rules_hash, rules_hash[goal]
      end

      it "raises error if a command fails" do
        error_msg = "Failed: c1"
        Make.should_receive(:system).with("c1").and_raise error_msg
        expect { Make.build_target rules_hash, rules_hash[goal] }.to raise_error error_msg
      end
    end

    context "rule with dependent rules" do
      let(:rule1) { {:target => "t1", :prerequisites => ["t2", "t3"], :commands => ["1c1", "1c2"], :built => false} }
      let(:rule2) { {:target => "t2", :prerequisites => ["2d1", "2d2"], :commands => ["2c1", "2c2"], :built => false} }
      let(:rule3) { {:target => "t3", :prerequisites => [], :commands => ["3c1", "3c2"], :built => false} }
      let(:rules_hash) { make_rules_hash [rule1, rule2, rule3] }
      before do
        Make.stub(:need_to_build).and_return true
      end
      it "executes commands in correct order" do
        Make.should_receive(:system).with("2c1").ordered.and_return true
        Make.should_receive(:system).with("2c2").ordered.and_return true
        Make.should_receive(:system).with("3c1").ordered.and_return true
        Make.should_receive(:system).with("3c2").ordered.and_return true
        Make.should_receive(:system).with("1c1").ordered.and_return true
        Make.should_receive(:system).with("1c2").ordered.and_return true
        Make.build_target rules_hash, rules_hash["t1"]
      end
    end
  end

end
