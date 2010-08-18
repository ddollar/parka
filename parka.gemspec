# this is only necessary to build from trunk rather than a release
$:.unshift File.expand_path("../lib", __FILE__)

require "rubygems"
require "parka/specification"

Parka::Specification.new do |gem|
  gem.name     = "parka"
  gem.version  = Parka::VERSION
  gem.summary  = "Simple gem building using bundler"
  gem.homepage = "http://github.com/ddollar/parka"
end
