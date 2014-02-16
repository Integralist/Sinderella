# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Cinderella/version'

Gem::Specification.new do |spec|
  spec.name          = "Cinderella"
  spec.version       = Cinderella::VERSION
  spec.authors       = ["Integralist"]
  spec.email         = ["mark.mcdx@gmail.com"]
  spec.summary       = 'Transform data for short period of time'
  spec.description   = 'Allows authors to pass a code block to transform data object for a specific period of time'
  spec.homepage      = 'https://github.com/Integralist/Cinderella'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
end
