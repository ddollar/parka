# this is only necessary to build from trunk rather than a release
$:.unshift File.expand_path("../../lib", __FILE__)

require "rubygems"
require "parka/specification"

Parka::Specification.new do |gem|
  gem.name     = "somegem"
  gem.version  = Somegem::VERSION
  gem.summary  = "A sample gem"
  gem.homepage = "http://example.org"
end