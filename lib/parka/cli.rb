require "rubygems/dependency_installer"
require "parka"
require "thor"

class Parka::CLI < Thor

  desc "build [GEMSPEC]", "Build the gem"

  def build(gemspec_filename=nil)
    gemspec  = Gem::Specification.load(gemspec_filename || default_gemspec)
    filename = "pkg/#{gemspec.file_name}"

    FileUtils.mkdir_p File.dirname(filename)
    Gem::Builder.new(gemspec).build
    FileUtils.mv gemspec.file_name, filename

    filename
  end

  desc "build [GEMSPEC]", "Build and install the gem"

  def install(gemspec_filename=nil)
    gemfile = build(gemspec_filename)
    installer = Gem::DependencyInstaller.new
    installer.install gemfile
    say "Successfully installed #{File.basename(gemfile)}"
  end

private ######################################################################

  def chroot(dir)
    FileUtils.mkdir_p dir

    Dir.chdir(dir) { yield }
  end

  def default_gemspec
    "#{File.basename(Dir.pwd)}.gemspec"
  end

  def error(message)
    puts "ERROR: #{message}"
    exit 1
  end

end
