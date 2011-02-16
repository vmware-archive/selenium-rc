module SeleniumRC

  class Server
    attr_accessor :host
    attr_accessor :port
    attr_accessor :args
    attr_accessor :timeout

    def self.boot(*args)
      new(*args).boot
    end

    def initialize(host, port = nil, options = {})
      @host = host
      @port = port || 4444
      @args = options[:args] || []
      @timeout = options[:timeout] || 60
    end

    def boot
      start
      wait
      at_exit { stop }
      self
    end

    def start
      command = "java -jar \"#{jar_path}\""
      command << " -port #{port}"
      command << " #{args.join(' ')}" unless args.empty?
      begin
        fork do
          system(command)
          at_exit { exit!(0) }
        end
      rescue NotImplementedError
        Thread.start do
          system(command)
        end
      end
    end

    def jar_path
      File.expand_path("#{File.dirname(__FILE__)}/../../vendor/selenium-server.jar")
    end

    def wait
      $stderr.print "==> Waiting for Selenium Server on port #{port}... "
      wait_for_service_with_timeout
      $stderr.print "Ready!\n"
    rescue ServerNotStarted
      fail
    end

    def fail
      $stderr.puts
      $stderr.puts
      $stderr.puts "==> Failed to boot the Selenium Server... exiting!"
      exit
    end

    def stop
      selenium_command('shutDownSeleniumServer')
    end

    def ready?
      begin
        selenium_command('testComplete') == 'OK'
      rescue Errno::ECONNREFUSED, Errno::ECONNREFUSED, Errno::EPIPE, Net::HTTPBadResponse
        false
      end
    end

    protected

    def selenium_command(command)
      Net::HTTP.get(host, "/selenium-server/driver/?cmd=#{command}", port)
    end

    def wait_for_service_with_timeout
      start_time = Time.now
      until ready?
        if @timeout && (Time.now > (start_time + @timeout))
          raise ServerNotStarted.new("Selenium Server was not ready for connections after #{@timeout} seconds")
        end
      end
    end
  end

  class ServerNotStarted < Exception
  end
end
