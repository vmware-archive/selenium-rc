require 'bundler'
Bundler.require(:default, :development, :test)

RSpec.configure do |config|
  config.mock_with :rr
end
