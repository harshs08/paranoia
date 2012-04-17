# -*- encoding: utf-8 -*-
require File.expand_path("../lib/paranoia/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "paranoia"
  s.version     = Paranoia::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["radarlistener@gmail.com"]
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/paranoia"
  s.summary     = "acts_as_paranoid, without the clusterfuck"
  s.description = "acts_as_paranoid, without the clusterfuck"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "paranoia"
  
  s.add_dependency "activerecord", ">= 3.0.0"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rake", "0.8.7"
  
  s.files        = [".gitignore", "Gemfile", "Gemfile.lock", "README.md", "Rakefile", "lib/paranoia.rb", "lib/paranoia/version.rb", "paranoia.gemspec", "test/paranoia_test.rb"]
  s.executables  = []
  s.require_path = 'lib'
end
