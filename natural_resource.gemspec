$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "natural_resource/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "natural_resource"
  s.version     = NaturalResource::VERSION
  s.authors     = ["Robert White"]
  s.email       = ["robert@terracoding.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of NaturalResource."
  s.description = "TODO: Description of NaturalResource."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5"
  s.add_dependency "pundit", "~> 1.0.1"
  s.add_dependency "ransack", "~> 1.7.0"
  s.add_dependency "will_paginate", "~> 3.0.7"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'haml-rails'
end
