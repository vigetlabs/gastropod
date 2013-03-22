$:.push File.expand_path("../lib", __FILE__)

require "gastropod/version"

Gem::Specification.new do |s|
  s.name        = "gastropod"
  s.version     = Gastropod::VERSION
  s.authors     = ["James Cook", "Patrick Reagan"]
  s.email       = ["james.cook@viget.com"]
  s.homepage    = "https://github.com/vigetlabs/gastropod"
  s.summary     = s.description = "Simple library for generating slugs"

  s.files = Dir["lib/**/*"] + %w(MIT-LICENSE README.md gastropod.gemspec)
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "activerecord", "~> 3.1"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec'
end
