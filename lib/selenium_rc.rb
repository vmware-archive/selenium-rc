dir = File.dirname(__FILE__)
require "socket"
require "#{dir}/selenium_rc/server"
require "net/http"

module SeleniumRC
  SERVER_JAR_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', 'vendor', 'selenium-server.jar'))
end