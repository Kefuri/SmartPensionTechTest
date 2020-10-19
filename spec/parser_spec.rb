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
end