# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'airbrite/version'

Gem::Specification.new do |spec|
  spec.name          = "airbrite"
  spec.version       = Airbrite::VERSION
  spec.authors       = ["Finbarr Taylor"]
  spec.email         = ["finbarrtaylor@gmail.com"]
  spec.description   = "Airbrite is e-commerce for developers"
  spec.summary       = "Ruby bindings for the Airbrite API"
  spec.homepage      = "https://www.airbrite.io/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "multi_json"
  spec.add_dependency "faraday"
  spec.add_dependency "hashie", "2.0.5"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "pry"
end
