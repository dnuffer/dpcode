$:.unshift(*Dir[File.dirname(__FILE__)])
if File.exist?(File.dirname(__FILE__) + "/scratch.rb")
  require 'scratch'
else
  require 'solution'
end

require 'rspec'

include Make

describe "execute" do
	let(:rules) { [{:target => "t1", :prerequisites => [], :commands => [], :built => false}] }
	context "verifying expectations of execute with default goal" do
		it "calls build_target" do
			Make.should_receive(:build_target)
		end

		it "calls build_target with a hash of rules and the goal" do
			rules_hash = Hash[rules.map { |x| [x[:target], x] }]
			Make.should_receive(:build_target).with(rules_hash, rules_hash[rules.first[:target]])
		end

		after do
			Make.execute(rules)
		end
	end

	it "uses goal" do
		rules = [{:target => "t1", :prerequisites => [], :commands => [], :built => false},
						 {:target => "t2", :prerequisites => [], :commands => [], :built => false}]
		rules_hash = Hash[rules.map { |x| [x[:target], x] }]
		Make.should_receive(:build_target).with(rules_hash, rules_hash["t2"])
		Make.execute(rules, "t2")
	end

	it "throws if goal is invalid" do
		lambda { Make.execute(rules, "bad") }.should raise_error("Invalid target: bad")
	end
end

describe "need_to_build" do
	it "returns true if target doesn't exist" do
		File.stub(:exist?).with("target").and_return(false)
		Make.need_to_build([], "target").should == true
	end
	
	context "target exists" do
		before do
			File.stub(:exist?).with("target").and_return(true)
		end

		it "returns true if any dependencies are newer" do
			File.stub(:mtime).with("target").and_return(Time.new(2000))
			File.stub(:mtime).with("d1").and_return(Time.new(1999))
			File.stub(:mtime).with("d2").and_return(Time.new(2001))
			Make.need_to_build(["d1", "d2"], "target").should == true
		end

		it "returns true if any dependencies are same date" do
			File.stub(:mtime).with("target").and_return(Time.new(2000))
			File.stub(:mtime).with("d1").and_return(Time.new(1999))
			File.stub(:mtime).with("d2").and_return(Time.new(2000))
			Make.need_to_build(["d1", "d2"], "target").should == true
		end

		it "returns false if all dependencies are older" do
			File.stub(:mtime).with("target").and_return(Time.new(2000))
			File.stub(:mtime).with("d1").and_return(Time.new(1999))
			File.stub(:mtime).with("d2").and_return(Time.new(1999))
			Make.need_to_build(["d1", "d2"], "target").should == false
		end
	end
end

describe "build_target" do
	it "returns without running commands if need_to_build return false" do
		rules = [{:target => "t1", :prerequisites => [], :commands => [], :built => false}]
		rules_hash = Hash[rules.map { |x| [x[:target], x] }]
		goal = rules_hash["t1"]
		Make.stub(:need_to_build).and_return false
		Make.should_not_receive(:system)
		Make.build_target(rules_hash, goal)
	end

	it "returns without running commands if built is true" do
		rules = [{:target => "t1", :prerequisites => [], :commands => [], :built => true}]
		rules_hash = Hash[rules.map { |x| [x[:target], x] }]
		goal = rules_hash["t1"]
		Make.stub(:need_to_build).and_return true
		Make.should_not_receive(:system)
		Make.build_target(rules_hash, goal)
	end

	it "executes commands and marks built true" do
		rules = [{:target => "t1", :prerequisites => ["d1", "d2"], :commands => ["ct1", "ct2"], :built => false},
						 {:target => "d1", :prerequisites => [], :commands => ["cd1", "cd2"], :built => false}]
		Make.stub(:need_to_build).and_return true
		Make.should_receive(:system).with("cd1").ordered.and_return(true)
		Make.should_receive(:system).with("cd2").ordered.and_return(true)
		Make.should_receive(:system).with("ct1").ordered.and_return(true)
		Make.should_receive(:system).with("ct2").ordered.and_return(true)
		
		Make.execute(rules, "t1")
		rules.all? { |rule| rule[:built] == true }.should == true
	end
end

