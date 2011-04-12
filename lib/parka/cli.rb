require "crack"
require "rubygems/commands/push_command"
require "rubygems/dependency_installer"
require "parka"
require "rest_client"
require "thor"

class Parka::CLI < Thor

  desc "build [GEMSPEC]", "Build the gem"

  method_option :filename, :type => :string, :aliases => "-f",
                           :desc => "Build to the specified filename"

  def build(gemspec_filename=nil)
    gemspec  = Gem::Specification.load(gemspec_filename || default_gemspec)
    filename = options[:filename] || "pkg/#{gemspec.file_name}"

    say "Building #{gemspec.file_name}"

    FileUtils.mkdir_p File.dirname(filename)
    Gem::Builder.new(gemspec).build
    FileUtils.mv gemspec.file_name, filename

    filename
  end

  desc "install [GEMSPEC]", "Build and install the gem"

  def install(gemspec_filename=nil)
    original_home = ENV["GEM_HOME"]
    gemfile = build(gemspec_filename)
    ENV["GEM_HOME"] = original_home

    system "gem install #{gemfile}"
  end

  desc "push [GEMSPEC]", "Build the gem and push it to GitHub and RubyGems.org"

  method_option :create,   :type => :boolean, :aliases => "-c",
                           :desc => "Create a Github repository for this project"

  method_option :filename, :type => :string, :aliases => "-f",
                           :desc => "Build to the specified filename"

  def push(gemspec_filename=nil)
    gemspec = Gem::Specification.load(gemspec_filename || default_gemspec)
    gemfile = options[:filename] || build(gemspec_filename)

    # create github remote
    remotes = %x{ git remote }.strip.split("\n")
    unless remotes.include?("github")
      %x{ git remote add github git@github.com:#{github_username}/#{gemspec.name}.git }
    end

    # create github repo
    if options[:create]
      begin
        github["repos/create"].post(
          :name        => gemspec.name,
          :description => gemspec.summary,
          :homepage    => gemspec.homepage,
          :public      => "1"
        )
      rescue
        error "Unable to create GitHub repository: #{gemspec.name}"
      end
    end

    # create release tag
    %x{ git tag v#{gemspec.version} }

    # push to github
    %x{ git push github master --tags }

    # push to rubygems
    pusher = Gem::Commands::PushCommand.new
    pusher.send_gem gemfile
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

  def github
    username = github_username + "/token"
    password = github_token
    RestClient::Resource.new("http://github.com/api/v2/json", username, password)
  end

  def github_username
    %x{ git config github.user }.strip
  end

  def github_token
    %x{ git config github.token }.strip
  end

  def github_repositories
    Crack::JSON.parse(github["repos/show/#{github_username}"].get)["repositories"]
  end

end
