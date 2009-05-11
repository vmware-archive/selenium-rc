require File.expand_path("#{File.dirname(__FILE__)}/spec_helper")

describe "bin/selenium-rc" do
  attr_reader :root_dir
  before do
    dir = File.dirname(__FILE__)
    @root_dir = File.expand_path("#{dir}/..")
    unless File.exists?("#{root_dir}/vendor/selenium-server.jar")
      raise "vendor/selenium-server.jar does not exist. Try running `rake download_jar_file` to install the jar file."
    end
  end

  after do
    system("lsof -i tcp:4444 | grep '(LISTEN)' | awk '{print $2}' | xargs kill -9")
    TCPSocket.wait_for_service_termination(:host => "0.0.0.0", :port => 4444)
  end

  it "starts the SeleniumRC server from the downloaded jar file" do
    Dir.chdir(root_dir) do
      system("bin/selenium-rc &") || raise("bin/selenium-server failed")
    end

    start_time = Time.now
    timeout = 15
    until SeleniumRC::Server.service_is_running?
      if Time.now > (start_time + timeout)
        raise SocketError.new("Socket did not open within #{timeout} seconds")
      end
    end
  end
end