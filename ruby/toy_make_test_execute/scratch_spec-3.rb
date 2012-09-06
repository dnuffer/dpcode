$:.unshift(*Dir[File.dirname(__FILE__)])
if File.exist?(File.dirname(__FILE__) + "/scratch.rb")
  require 'scratch'
else
  require 'solution'
end

require 'rspec'

describe Make do
  let(:rules) { [{:target => "t", :prerequisites => ["d1", "d2"], :commands => ["c1", "c2"], :built => false}] }

  describe "execute" do
    context "single rule" do
      it "calls build_target" do
        Make.should_receive(:build_target)
        Make.execute(rules)
      end

      it "calls build_target with parameters rule_hash and goal" do
        rules_hash = Hash[rules.map { |x| [x[:target], x] } ]
        Make.should_receive(:build_target).with(rules_hash, rules_hash["t"])
        Make.execute(rules)
      end
    end

    it "calls build_target with parameters rule_hash and goal as specified by parameter" do
      rules = [{:target => "t", :prerequisites => ["d1", "d2"], :commands => ["c1", "c2", :built => false]},
               {:target => "t2", :prerequisites => ["d1", "d2"], :commands => ["c1", "c2", :built => false]}]
      rules_hash = Hash[rules.map { |x| [x[:target], x] } ]
      Make.should_receive(:build_target).with(rules_hash, rules_hash["t2"])
      Make.execute(rules, "t2")
    end
  end

  describe "build_target" do
    let(:rules_hash) { Hash[rules.map { |x| [x[:target], x] } ] }
    it "returns if goal[:built] is true" do
      goal = rules_hash["t"]
      goal[:built] = true
      Make.should_not_receive(:system)
      Make.build_target(rules_hash, goal)
    end

    it "returns if need_to_build is false" do
      Make.stub(:need_to_build).and_return false
      Make.should_not_receive(:system)
      Make.build_target(rules_hash, rules_hash["t"])
    end

    context "built single rule" do
      let(:goal) { rules_hash["t"] }
      it "sets :built to true" do
        Make.should_receive(:system).with("c1").ordered.and_return true
        Make.should_receive(:system).with("c2").ordered.and_return true
        Make.build_target(rules_hash, goal)
        goal[:built].should == true
      end

      it "throws if system command fails" do
        Make.should_receive(:system).with("c1").and_return false
        expect { Make.build_target(rules_hash, goal) }.to raise_error("Failed: c1")
      end
    end

    context "builds multiple dependencies" do
      let(:rules) { 
        [
          {:target => "t", :prerequisites => ["d1", "d2"], :commands => ["6", "7"], :built => false},
          {:target => "d1", :prerequisites => ["d3"], :commands => ["2", "3"], :built => false},
          {:target => "d2", :prerequisites => ["not a goal"], :commands => ["4", "5"], :built => false},
          {:target => "d3", :prerequisites => [], :commands => ["1"], :built => false},
        ] 
      }
      it "runs all commands in correct order" do
        7.times { |x| Make.should_receive(:system).with("#{x+1}").ordered.and_return true }
        @goal = rules_hash["t"]
        Make.build_target(rules_hash, @goal)
      end
    end
  end

end

