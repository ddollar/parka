require "bundler"
require "parka"
require "rubygems"

class Parka::Specification < Gem::Specification

  def self.new(&block)
    spec = Gem::Specification.new(&block)

    spec.author ||= default_author
    spec.email  ||= default_email

    spec.files = default_files if spec.files.empty?

    add_bundler_dependencies(spec)

    spec
  end

private ######################################################################

  def self.default_author
    %x{ git config user.name }
  end

  def self.default_email
    %x{ git config user.email }
  end

  def self.default_files
    %x{ git ls-files }.split("\n").select { |f| f.match(/^(bin|data|ext|lib|spec|test)/) }
  end

  def self.add_bundler_dependencies(spec)
    groups = Bundler.definition.groups - [:development, :test]
    deps   = Bundler.definition.dependencies.select { |d| (d.groups & groups).any? }
    deps.each { |d| spec.add_dependency(d.name, d.requirement) }
  end

end
