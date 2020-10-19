require 'parser'

describe LogParser do
  subject { described_class.new(arguments).print_log }
 
  let(:arguments) { ['test_log.log'] }
  it "can run as a script" do
    subject
  end

  context "#print_log" do
    it "should print out the log given to the script" do
      log = 'log'
      parser = LogParser.new(log)
      expect { parser.print_log }.to output(log + "\n").to_stdout
    end
  end

  context "#create_log_array" do
    it "should return an array" do
      log = 'spec/test_log.log'
      parser = LogParser.new(log)
      array = parser.create_log_array
      expect(array).to be_an(Array)
    end

    it "should use File to read lines of the file" do
      logfile = "log1\nlog2\nlog3"
      parser = LogParser.new(logfile)
      expect(File).to receive(:readlines).with(an_instance_of(String)).and_return(['log1', 'log2', 'log3'])
      array = parser.create_log_array
      expect(array).to eq(['log1', 'log2', 'log3'])
    end
      
  end
end