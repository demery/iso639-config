$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "iso639_config/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "iso639_config"
  s.version     = Iso639Config::VERSION
  s.authors     = ["Doug Emery"]
  s.email       = ["doug@emeryit.com"]
  # s.homepage    = "TODO"
  s.summary     = "Rails pages to configure ISO 639.2 language selection options for Rails applications."
  s.description = "Rails pages to configure ISO 639.2 language selection options for Rails applications."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  #s.add_dependency "rails", "~> 3.1"
  s.add_dependency "iso-639"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "rails", "~> 3.1"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "foreman"
  s.add_development_dependency "thin"
  s.add_development_dependency "factory_girl_rails"
end
