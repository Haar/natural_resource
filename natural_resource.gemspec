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

  s.add_development_dependency "sqlite3"
end
