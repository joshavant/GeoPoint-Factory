# -*- encoding: utf-8 -*-
require File.expand_path('../lib/geopoint_factory/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josh Avant"]
  gem.email         = ["joshavant@gmail.com"]
  gem.description   = %q{Generate geographic points from a shapefile.}
  gem.summary       = %q{Generate useful, RGeo-compatible geographic points located within a supplied shapefile.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "geopoint_factory"
  gem.require_paths = ["lib"]
  gem.version       = GeoPointFactory::VERSION
  
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  
  gem.add_runtime_dependency     'rgeo'
  gem.add_runtime_dependency     'rgeo-shapefile'
end
