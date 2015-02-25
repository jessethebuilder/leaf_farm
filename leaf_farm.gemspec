$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "leaf_farm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "leaf_farm"
  s.version     = LeafFarm::VERSION
  s.authors     = ["Anysoft"]
  s.email       = ["jessethebuilder@yahoo.com"]
  s.homepage    = "http://www.anysoft.us"
  s.summary     = "Leafly Gem"
  s.description = "A Gem for working with the Leafly API"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rest-client"

  s.add_development_dependency "sqlite3"



  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  s.test_files = Dir["spec/**/*"]

end
