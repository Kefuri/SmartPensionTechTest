class LogParser
  def initialize(log)
    @log = log
  end

  def print_log
    puts @log
  end

  def create_log_array
    return []
  end
end


if $PROGRAM_NAME == __FILE__
  LogParser.new(ARGV).print_log
end