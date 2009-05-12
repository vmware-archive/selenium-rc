module SeleniumRC

  class Server
    class << self
      def boot
        new.boot
      end

      def host
        ENV["SELENIUM_SERVER_HOST"] || "0.0.0.0"
      end

      def port
        ENV["SELENIUM_SERVER_PORT"] || "4444"
      end

      def service_is_running?
        begin
          socket = TCPSocket.new(host, port)
          socket.close unless socket.nil?
          true
        rescue Errno::ECONNREFUSED,
               Errno::EBADF           # Windows
          false
        end
      end
    end

    def boot
      start
      wait
      stop_at_exit
    end

    def start
      command = "java -jar \"#{jar_path}\""
      command << " -port #{self.class.port}"
      puts "Running: #{command}"
      system(command)
    end

    def stop_at_exit
      at_exit do
        stop
      end
    end

    def jar_path
      File.expand_path("#{File.dirname(__FILE__)}/../../vendor/selenium-server.jar")
    end

    def wait
      $stderr.print "==> Waiting for Selenium RC server on port #{port}... "
      wait_for_service_with_timeout
      $stderr.print "Ready!\n"
    rescue SocketError
      fail
    end

    def fail
      $stderr.puts
      $stderr.puts
      $stderr.puts "==> Failed to boot the Selenium RC server... exiting!"
      exit
    end

    def stop
      Net::HTTP.get(host, '/selenium-server/driver/?cmd=shutDown', port)
    end

    def host
      self.class.host
    end

    def port
      self.class.port
    end

    def service_is_running?
      self.class.service_is_running?
    end

    protected
    def wait_for_service_with_timeout
      start_time = Time.now
      timeout = 15

      until self.class.service_is_running?
        if timeout && (Time.now > (start_time + timeout))
          raise SocketError.new("Socket did not open within #{timeout} seconds")
        end
      end
    end
  end

end
