# parka

## Installation

    $ gem install parka
   
## Usage

Create a `projectname.gemspec` file in the root of your gem like this:

    require "rubygems"
    require "parka/specification"

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

Build a .gem file and push it to Github and RubyGems.org

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