require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

module SeleniumRC
  describe Server do

    before do
      @server = Server.new
      stub(@server).log
      stub(@server).fork.yields
    end

    describe "#start" do

      it "launches java with the jar file and port" do
        stub(Server).port { "5555" }
        expected_command = %Q{java -jar "/path/to/the.jar" -port 5555}
        mock(@server).system(expected_command)
        mock(@server).jar_path {"/path/to/the.jar"}
        @server.start
      end

      context "when passed additional arguments" do
        it "adds the additional arguments to the selenium start command" do
          expected_command = %Q{java -jar "/path/to/the.jar" -port 4444 -browserSideLog -suppressStupidness}
          mock(@server).system(expected_command)
          mock(@server).jar_path {"/path/to/the.jar"}
          @server.start("-browserSideLog", "-suppressStupidness")
        end
      end
    end
  end
end
