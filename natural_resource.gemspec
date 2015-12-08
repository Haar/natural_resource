$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "natural_resource/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "natural_resource"
  s.version     = NaturalResource::VERSION
  s.authors     = ["Robert White"]
  s.email       = ["robert@terracoding.com"]
  s.homepage    = "http://www.github.com/haar/natural_resource"
  s.summary     = "Small Rails Framework to speed up CRUD controllers"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "pundit", "~> 1.0"
  s.add_dependency "ransack", "~> 1.7"
  s.add_dependency "will_paginate", "~> 3.0"

  s.add_development_dependency "sqlite3", '~> 1.3'
  s.add_development_dependency 'rspec-rails', '~> 3.4'
  s.add_development_dependency 'haml-rails', '~> 0.9'
end
