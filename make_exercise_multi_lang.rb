#!/usr/bin/env ruby

require 'optparse'
require './lang_selector'

$existing_dir = ""
$langs = []

options = OptionParser.new do |o|
  o.banner  = "Usage: #{File.basename(__FILE__)} [options]\n" +
              "  create directories and Makefile symlinks for other languages of an existing exercise\n" +
              "  Valid langs:\n      #{LangSelector.known_langs.join("\n      ")}\n\n" 
  o.on("-d", "--dir DIR", "Directory of existing exercise. Required.") { |dir| $existing_dir = dir }
  o.on("-l", "--langs x,y,z", Array, "Comma separated list of langs. Defaults to all.") do |list|
    $langs += list
  end
  o.on_tail('--help') { puts o; exit }
end

begin
  options.parse! 
rescue OptionParser::ParseError => e
  puts e
  puts options
  exit 1
end

fail "dir was not specified" if $existing_dir == ""
fail "dir must be <lang>/<name>" unless $existing_dir.split("/").size == 2
$existing_lang, $name = $existing_dir.split("/")

$langs = LangSelector.known_langs if $langs == []

fail "exercise lang is not one of #{$langs}" unless $langs.include?($existing_lang)

puts "Exercise: #{$name}"
puts "Langs: #{$langs.join(", ")}"

def system_must_succeed(command)
  puts "command:\n#{command}"
  #fail "Failed running \"#{command}\"" unless system(command)
end

system_must_succeed("./setup_new_exercise.rb --name \"#{$name}\" --langs \"#{$langs.join(",")}\"")
if File.exists?("#{$existing_dir}/README")
  system_must_succeed("mv -f \"#{$existing_dir}\"/README \"#{$name}/\"")
end
system_must_succeed("mv -f \"#{$existing_dir}\"/* \"#{$name}/#{$existing_lang}\"")
system_must_succeed("rmdir \"#{$existing_dir}\"")
system_must_succeed("git rm -r \"#{$existing_dir}\"")
system_must_succeed("git add \"#{$name}\"")
