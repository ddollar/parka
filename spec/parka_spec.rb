require "spec_helper"
require "parka"

describe Parka do
  it "has a VERSION" do
    Parka::VERSION.should_not be_nil
  end
end
