# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_return_authorizations_frontend'
  s.version     = '3.0.0'
  s.summary     = 'Allow customers to request returns'
  s.description = 'Allow customers to create a Return Request to be approved by Spree Admins'
  s.required_ruby_version = '>= 2.1.0'

  s.author    = 'Nebulab'
  s.email     = 'info@nebulab.it'
  s.homepage  = 'http://github.com/nebulab/spree_return_authorizations_frontend'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'awesome_print'
end
