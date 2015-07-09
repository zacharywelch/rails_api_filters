$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_api_filters/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_api_filters"
  s.version     = RailsApiFilters::VERSION
  s.authors     = ["zwelchcb"]
  s.email       = ["Zachary.Welch@careerbuilder.com"]
  s.homepage    = "https://cagit.careerbuilder.com/zwelch/rails_api_filters"
  s.summary     = "Common filters for Rails API."
  s.description = "Common filters for Rails API."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
