require "rspec"

Rspec.configure do |config|
  config.color_enabled = true
  config.mock_with :rr
end
