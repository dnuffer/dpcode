#!/usr/bin/env ruby
require 'find'
scratch_files = Find.find(".").
  find_all { |fn| fn =~ /^\.\/[^\/]+\/[^\/]+\/scratch\.[^.]+$/ }.
  find_all { |fn| File.size?(fn) }.
  to_a

scratch_dirs = scratch_files.map { |fn| File.dirname(fn) }.uniq

solution_files = Find.find(".").
  find_all { |fn| fn =~ /^\.\/[^\/]+\/[^\/]+\/solution\.[^.]+$/ }.
  find_all { |fn| File.size?(fn) }.
  to_a

solution_dirs = solution_files.map { |fn| File.dirname(fn) }.uniq

scratch_no_solution = scratch_dirs - solution_dirs
if scratch_no_solution.length > 0
  puts (scratch_no_solution).join("\n")
else
  puts "No missing solutions found"
end
