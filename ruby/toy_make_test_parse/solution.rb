require 'rspec'

class Object
  def if_nil_then(x)
    if nil?
      x
    else
      self
    end
  end
end

module Make
  # takes as input, the contents of a makefile, produces an ast of it
  # @param [String] input
  def self.parse(input)
    input_split_on_non_tabs = input.lines.reduce([]) { |memo, line| reduce_to_targets(memo, line) }
    input_split_to_rules = input_split_on_non_tabs.reject{|e| e == %W(\n) || e == [""] }
    input_split_to_rules.map {|rule_lines| parse_rule(rule_lines) }
  end

  def self.parse_rule(rule_lines)
    target = rule_lines.first.split(":").first
    prerequisites = rule_lines.first.split(":")[1].if_nil_then("").split(" ")
    commands = rule_lines[1..-1]
    make_rule(target, prerequisites, commands)
  end

  def self.make_rule(target, prerequisites, commands)
    {:target => target, :prerequisites => prerequisites, :commands => commands, :built => false}
  end

  def self.reduce_to_targets(memo, line)
    if line.start_with?("\t");
      memo.last.push(line.strip)
    else
      memo.push([line.strip])
    end
    memo
  end
end

if __FILE__ == $0
  system "rspec #{__FILE__}"
end

describe Make do
  it "parses one target" do
    Make.parse("one:").should == [{:target => "one", :prerequisites => [], :commands => [], :built => false}]
  end
  it "parses target and prerequisite" do
    Make.parse("one: p1").should == [{:target => "one", :prerequisites => ["p1"], :commands => [], :built => false}]
  end
  it "parses target and two prerequisite" do
    Make.parse("one: p1 p2").should == [{:target => "one", :prerequisites => ["p1", "p2"], :commands => [], :built => false}]
  end
  it "parses commands" do
    Make.parse(<<EOS
one: p1
\tc1
\tc2
EOS
              ).should == [{:target => "one", :prerequisites => ["p1"], :commands => ["c1", "c2"], :built => false}]
  end
  it "parses multiple rules" do
    Make.parse(<<EOS
one: p1
\tc1
\tc2

two: p2
\tc1
\tc2
EOS
              ).should == [
                {:target => "one", :prerequisites => ["p1"], :commands => ["c1", "c2"], :built => false},
                {:target => "two", :prerequisites => ["p2"], :commands => ["c1", "c2"], :built => false}]
  end
end
