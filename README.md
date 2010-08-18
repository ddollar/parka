# parka

## Installation

    $ gem install parka
   
## Usage

Create a `projectname.gemspec` file in the root of your gem like this:

    require "rubygems"
    require "parka/specification"

    require "somegem"

    Parka::Specification.new do |gem|
      gem.name     = "somegem"
      gem.version  = Somegem::VERSION
      gem.summary  = "A sample gem"
      gem.homepage = "http://example.org"
    end
   
Create a `Gemfile` to declare the dependencies of your gem:

    source "http://rubygems.org"

    gem "rest-client"

    group :development do
      gem "parka"
    end

    group :test do
      gem "rake"
      gem "rcov"
      gem "rspec"
    end

Gems in the `development` and `test` groups will become development
dependencies of your gem.

## Building Gems

The gem can be built by using `gem build projectname.gemspec`
   
## Using the parka command-line tool

### parka build

    $ parka build
    Building somegem-0.1.gem
      Successfully built RubyGem
      Name: somegem
      Version: 0.1
      File: somegem-0.1.gem

### parka install

    $ parka install
    Building somegem-0.1.gem
      Successfully built RubyGem
      Name: somegem
      Version: 0.1
      File: somegem-0.1.gem
    Successfully installed somegem-0.1.gem
