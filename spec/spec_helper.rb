require "rspec"
require "rspec/autorun"
require "fileutils"
require "timeout"
require "tcp_socket_extension"
require "rr"
require "lsof"

dir = File.dirname(__FILE__)
$:.unshift(File.expand_path("#{dir}/../lib"))
require "selenium_rc"

RSpec.configure do |config|
  config.mock_with :rr
end
