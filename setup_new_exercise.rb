#!/usr/bin/env ruby

require 'optparse'
require './lang_selector'

$name = ""
$langs = []
$todo = "TODO: Write what the exercise should do"
options = OptionParser.new do |o|
  o.banner  = "Usage: setup_new_exercise.rb [options]\n" +
              "  create directories and Makefile symlinks for a new exercise\n" +
              "  Valid langs:\n      #{LangSelector.known_langs.join("\n      ")}\n\n" 
  o.on("-n", "--name NAME", "Exercise name. Required.") { |name| $name = name }
  o.on("-l", "--langs x,y,z", Array, "Comma separated list of langs. Defaults to all.") do |list|
    $langs += list
  end
  o.on("-t", "--todo TODO") { |todo| $todo = todo }
  o.on_tail('--help') { puts o; exit }
end

begin
  options.parse! 
rescue OptionParser::ParseError => e
  puts e
  puts options
  exit 1
end

fail "name was not specified" if $name == ""

$langs = LangSelector.known_langs if $langs == []

puts "Exercise: #{$name}"
puts "Langs: #{$langs.join(", ")}"

fail "Directory for #{$name} already exists" if Dir.exists?($name)

Dir.mkdir($name)
Dir.chdir($name) do
  $langs.each do |lang|
    Dir.mkdir(lang)
    File.symlink("../../makefiles/Makefile-#{lang}", "#{lang}/Makefile")
    open("#{lang}/solution.#{LangSelector.known_langs_and_extensions[lang]}", "w") {}
    open("#{lang}/start.#{LangSelector.known_langs_and_extensions[lang]}", "w") {}
  end
  open("README", "w") { |readme| readme.puts  }
  open("check", "w", 0775) { |check| check.puts <<EOS
#!/bin/bash
#set -x
export PATH=.:$PATH
out=$($*)
[ "$out" = "Hello, world" ] || { printf "Failure\\nExpected: Hello, world\\nGot     : %s\\n" "$out"; exit 1; }
printf "Success!\\n"
EOS
  }
end
