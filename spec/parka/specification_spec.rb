require "spec_helper"
require "parka/specification"

describe Parka::Specification do
  
  describe "initializer" do
    let(:spec) { Parka::Specification.new }

    it "sets defaults" do
      mock($:).unshift(File.expand_path("../../parka/lib", __FILE__))

      mock(Parka::Specification).require("specification_spec")
      mock(Parka::Specification).default_author.returns("default_author")
      mock(Parka::Specification).default_email.returns("default_email")
      mock(Parka::Specification).add_bundler_dependencies.with_any_args

      any_instance_of(Gem::Specification) do |spec|
        stub(spec).summary.returns("default_description")
      end

      spec.author.should      == "default_author"
      spec.email.should       == "default_email"
      spec.description.should == "default_description"
      spec.rubyforge_project  == "nowarning"
    end
  end

end
