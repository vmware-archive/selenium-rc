require "rubygems"
require "spec"
require "spec/autorun"
require "fileutils"
require "timeout"
require "tcp_socket_extension"

dir = File.dirname(__FILE__)
$:.unshift(File.expand_path("#{dir}/../lib"))
require "selenium_rc"

Spec::Runner.configure do |config|
end
