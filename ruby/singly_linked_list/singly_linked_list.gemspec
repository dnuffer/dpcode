# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'singly_linked_list/version'

Gem::Specification.new do |spec|
  spec.name          = "singly_linked_list"
  spec.version       = SinglyLinkedList::VERSION
  spec.authors       = ["Dan Nuffer"]
  spec.email         = ["danielnuffer@gmail.com"]
  spec.description   = %q{A singly linked list}
  spec.summary       = %q{A singly linked list}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
