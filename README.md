# parka

## Installation

    $ gem install parka
   
## Usage

Create a `projectname.gemspec` file in the root of your gem like this:

    require "rubygems"
    require "somegem/version"
    
    Gem::Specification.new do |gem|
      gem.name     = "somegem"
      gem.version  = Somegem::VERSION
      gem.author   = "Me"
      gem.summary  = "A sample gem"
      gem.homepage = "http://example.org"
      
      gem.add_dependency "rest-client"
    end
   
Create a `Gemfile` to declare the dependencies of your gem:

    source "http://rubygems.org"

    gemspec

    group :development do
      gem "parka"
    end

    group :test do
      gem "rake"
      gem "rcov"
      gem "rspec"
    end

## Using the parka command-line tool

### parka build

Build a .gem file.

    $ parka build
    Building somegem-0.1.gem
      Successfully built RubyGem
      Name: somegem
      Version: 0.1
      File: somegem-0.1.gem

### parka install

Build a .gem file and install it locally.

    $ parka install
    Building somegem-0.1.gem
      Successfully built RubyGem
      Name: somegem
      Version: 0.1
      File: somegem-0.1.gem
    Successfully installed somegem-0.1.gem

### parka push

Build a .gem file and push it to Github and RubyGems.org. Will create the GitHub repo if necessary.

    $ parka push
    Building somegem-0.1.gem
      Successfully built RubyGem
      Name: somegem
      Version: 0.1
      File: somegem-0.1.gem
    Delta compression using up to 8 threads.
    Compressing objects: 100% (8/8), done.
    Writing objects: 100% (9/9), 1.26 KiB, done.
    Total 9 (delta 3), reused 0 (delta 0)
    To git@github.com:ddollar/somegem.git
       edffa40..249581c  master -> master
     * [new tag]         v0.1   -> v0.1
    Pushing gem to RubyGems.org...
    Successfully registered gem: somegem (0.1)