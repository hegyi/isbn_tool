# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isbn_tool/version'

Gem::Specification.new do |spec|
  spec.name          = "isbn_tool"
  spec.version       = IsbnTool::VERSION
  spec.authors       = ["Adam Hegyi"]
  spec.email         = ["kecs.htc@gmail.com"]
  spec.description   = %q{Tool for validating and hyphenating ISBN13 strings.}
  spec.summary       = %q{Tool for validating and hyphenating ISBN13 strings.}

  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
