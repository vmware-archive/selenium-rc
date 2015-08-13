require 'bundler'
Bundler.require(:default, :development, :test)
$: << File.dirname(__FILE__) + '/../lib'
require 'selenium-rc'

RSpec.configure do |config|
  config.mock_with :rr
end
