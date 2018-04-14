$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "stripe/id/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stripe-id"
  s.version     = Stripe::Id::VERSION
  s.authors     = ["David Van Der Beek"]
  s.email       = ["earlynovrock@gmail.com"]
  s.homepage    = "https://github.com/dvanderbeek/stripe-id"
  s.summary     = "Add Stripe-style ID's to ActiveRecord models"
  s.description = "Add Stripe-style ID's to ActiveRecord models"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'activerecord', '>= 4.0.0'
  s.add_dependency 'friendly_id', '~> 5.1.0'

  s.add_development_dependency "sqlite3"
end
