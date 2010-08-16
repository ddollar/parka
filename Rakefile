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
  t.rcov_opts = [ "--exclude", Gem.default_dir , "--exclude", "spec" ]
end
