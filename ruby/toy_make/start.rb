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
    #TODO
  end

  def self.make_rule(target, prerequisites, commands)
    {:target => target, :prerequisites => prerequisites, :commands => commands, :built => false}
  end

  def self.need_to_build(dependencies, target)
    #TODO
  end

  # takes an ast of a makefile, target to build (nil means first), and executes commands in the correct order
  # @param [Array of Hash] rules
  # @param [String] goal
  def self.execute(rules, goal = nil)
    #TODO
  end

  def self.build_target(rules_hash, goal)
    #TODO
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
