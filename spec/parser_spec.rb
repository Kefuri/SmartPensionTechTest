require 'parser'

describe LogParser do
  context "print_log" do
    it "should print out the log given to the script" do
      log = ARGV
      parser = LogParser.new(log)
      expect(parser.print_log).to eq(log + '\n')
    end
  end
end