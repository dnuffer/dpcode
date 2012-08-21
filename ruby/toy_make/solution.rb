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

  def self.need_to_build(dependencies, target)
    return true unless File.exist? target
    return dependencies.any? { |dependency| File.mtime(dependency) >= File.mtime(target) }
  end

  # takes an ast of a makefile, target to build (nil means first), and executes commands in the correct order
  # @param [Array of Hash] rules
  # @param [String] goal
  def self.execute(rules, goal = nil)
    goal ||= rules.first[:target]

    rules_hash = Hash[rules.map { |x| [x[:target], x] }]

    raise "Invalid target: #{goal}" unless rules_hash[goal]

    build_target(rules_hash, rules_hash[goal])
  end

  def self.build_target(rules_hash, goal)
    return if goal[:built] || !need_to_build(goal[:prerequisites], goal[:target])

    # mark complete
    goal[:built] = true

    goal[:prerequisites].each do |dep|
      build_target(rules_hash, rules_hash[dep])
    end

    # execute commands
    goal[:commands].each do |command|
      raise "Failed: #{command}" unless system command
    end
  end

  # function that reads a file, parses it, and executes it.
  def self.driver(input, goal = nil)
    rules = parse(input)
    execute(rules, goal)
  end

end

if __FILE__ == $0
  Make.driver(File.open("Makefile", "r") { |f| f.read }, ARGV[0])
end
