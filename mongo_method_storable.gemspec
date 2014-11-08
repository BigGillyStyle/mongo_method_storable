# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongo_method_storable/version'

Gem::Specification.new do |spec|
  spec.name          = "mongo_method_storable"
  spec.version       = MongoMethodStorable::VERSION
  spec.authors       = ["Andy Pickler"]
  spec.email         = ["andy.pickler@gmail.com"]
  spec.summary       = %q{Store the output of methods in a Mongoid::Document class into MongoDB dynamic fields.}
  spec.description   = %q{Store the output of methods in a Mongoid::Document class into MongoDB dynamic fields. Lazily evaluates methods and stores the output in document...subsequent calls simply read the attribute value and do not run the method.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_dependency "mongoid", "~> 4.0.0"
end
