class LogParser
  def initialize(log)
    @log = log
  end

  def print_log
    puts @log
  end

  def create_log_array
    lines = File.readlines(@log)
    return lines
  end
end


if $PROGRAM_NAME == __FILE__
  LogParser.new(ARGV).print_log
end