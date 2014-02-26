# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watir-browser-factory/version'

Gem::Specification.new do |spec|
  spec.name          = "watir-browser-factory"
  spec.version       = Watir::Browser::Factory::VERSION
  spec.authors       = ["Dan Franko"]
  spec.email         = ["dfranko@gmail.com"]
  spec.description   = %q{Select appropriate browser local or sauce for execution}
  spec.summary       = %q{Simplify the selection of browsers local or remote for test execution.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "watir-webdriver"
end
