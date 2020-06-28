$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "cap/table/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "cap-table"
  spec.version     = Cap::Table::VERSION
  spec.authors     = ["Orban Botond"]
  spec.email       = ["orbanbotond@toptal.com"]
  spec.homepage    = "https://github.com/orbanbotond"
  spec.summary     = "CapTable management gem using mongoid."
  spec.description = "CapTable management gem using mongoid."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"
  spec.add_dependency "mongoid"
  spec.add_dependency "devise"
  spec.add_dependency "simple_form"
  spec.add_dependency 'bootstrap', '~> 4.5.0'
  spec.add_dependency 'slim'
  spec.add_dependency "mongoid-multitenancy-2"
  spec.add_development_dependency 'rspec-rails', '~> 4.0.1'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'mongoid-rspec'
end
