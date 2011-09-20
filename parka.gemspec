# this is only necessary to build from trunk rather than a release
$:.unshift File.expand_path("../lib", __FILE__)

require "rubygems"
require "parka/specification"

Gem::Specification.new do |gem|
  gem.name     = "parka"
  gem.version  = Parka::VERSION
  gem.author   = "David Dollar"
  gem.email    = "ddollar@gmail.com"
  gem.summary  = "Simple gem building using bundler"
  gem.homepage = "http://github.com/ddollar/parka"

  gem.executables = "parka"

  gem.add_dependency "crack",       "~> 0.3.0"
  gem.add_dependency "rest-client", "~> 1.6.7"
  gem.add_dependency "thor",        "~> 0.14.6"
end
