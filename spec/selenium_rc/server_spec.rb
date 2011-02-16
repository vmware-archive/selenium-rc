require 'spec_helper'

describe SeleniumRC::Server do

  def new_server(*args)
    server = SeleniumRC::Server.new(*args)
    stub(server).log
    stub(server).fork.yields
    server
  end

  describe ".boot" do
    let(:server) { new_server('localhost', 5555, {:timeout => 1}) }

    before do
      mock(server).start { true }
    end

    context "when the selenium server starts successfully" do
      it "returns an instance of the server" do
        mock(server).ready? { true }
        server.boot.should == server
      end
    end

    context "when the selenium server fails to start" do
      it "raises an exception after 60 seconds" do
        mock(server).ready?.any_number_of_times { false }
        expect { server.boot.should }.to raise_error(SystemExit)
      end
    end
  end

  describe "#start" do
    it "launches java with the jar file and port" do
      server = new_server("0.0.0.0", 5555)
      expected_command = %Q{java -jar "/path/to/the.jar" -port 5555}
      mock(server).system(expected_command)
      mock(SeleniumRC::Server).jar_path {"/path/to/the.jar"}
      server.start
    end

    context "when passed additional arguments" do
      it "adds the additional arguments to the selenium start command" do
        server = new_server("0.0.0.0", 4444, :args => ["-browserSideLog", "-suppressStupidness"])
        expected_command = %Q{java -jar "/path/to/the.jar" -port 4444 -browserSideLog -suppressStupidness}
        mock(server).system(expected_command)
        mock(SeleniumRC::Server).jar_path {"/path/to/the.jar"}
        server.start
      end
    end
  end
end
