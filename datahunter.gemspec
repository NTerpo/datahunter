# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datahunter/version'

Gem::Specification.new do |spec|
  spec.name          = "datahunter"
  spec.version       = Datahunter::VERSION
  spec.authors       = ["Terpo"]
  spec.email         = ["nicolas.terpolilli@gmail.com"]
  spec.summary       = %q{A Command Line Interface to find Open Datasets}
  spec.description   = %q{Command line interface to find open datasets via the Hunter API}
  spec.homepage      = "https://github.com/NTerpo/datahunter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.files.reject! { |fn| fn.include? "logo" }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_runtime_dependency "json", "~> 1.8.1"
  spec.add_runtime_dependency "commander", "~> 4.2.1"
  spec.add_runtime_dependency "rest_client", "~> 1.8.2"
  spec.add_runtime_dependency "launchy", "~> 2.4.3"
  spec.add_runtime_dependency "colorize", "~> 0.7.3"
end