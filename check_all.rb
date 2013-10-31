#!/usr/bin/env ruby

def dirs_to_check
  `find . -name 'solution.*' -size +1b | xargs -n 1 dirname | xargs -n 1 readlink -e`.split("\n").uniq.reject {|s| s =~ /\b(build|vendor)\b/ }
	#`find . -name 'solution.*' -size +1b | xargs -n 1 dirname | xargs -n 1 readlink -e | sort | uniq | grep -v -E '(build|vendor)'`.split("\n")
end

def list_make_targets
	`make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'`.split("\n")
end

def have_make_target(target)
  list_make_targets.include? target
end

dirs_to_check.each do |dir|
  Dir.chdir(dir) do
    puts "Checking #{dir}"
    system "make clean" if have_make_target "clean"
    raise "Dir #{dir} doesn't have check-solution" unless have_make_target "check-solution"
    if system "make check-solution"
      puts "Dir #{dir} passed!"
    else
      raise "Dir #{dir} failed check-solution!"
    end
  end
end

puts "Complete. All passed!"
