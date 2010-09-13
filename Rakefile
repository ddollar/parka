require "rubygems"
require "bundler"

Bundler.setup
Bundler.require(:default, :test)

require "rspec/core/rake_task"

desc "run all specs"
Rspec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

desc "generate and open rcov coverage report"
task :rcov => "rcov:build" do
  %x{ open coverage/index.html }
end

Rspec::Core::RakeTask.new("rcov:build") do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rcov = true
  t.rcov_opts = [
    "--exclude", Gem.default_dir,
    "--exclude", "spec\/",
    "--exclude", ".bundle",
    "--exclude", "\/rubygems\/"
  ]
end

# hack to run parka from trunk
namespace :parka do

  desc "Build the gem"
  task :build do
    system "ruby -rubygems bin/parka build"
  end

  desc "Build and install the gem"
  task :install do
    system "ruby -rubygems bin/parka install"
  end

  desc "Build the gem and push it to GitHub and RubyGems.org"
  task :push do
    system "ruby -rubygems bin/parka push"
  end

end
