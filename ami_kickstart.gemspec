# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ami_kickstart/version'

Gem::Specification.new do |spec|
  spec.name          = "ami_kickstart"
  spec.version       = AMIKickstart::VERSION
  spec.authors       = ["Neeraj"]

  spec.summary       = %q{A tool to build AMIs using kickstart}
  spec.description   = %q{A tool to build AMIs using kickstart}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
