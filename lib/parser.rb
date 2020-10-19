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

  def create_domain_hash(domains)
    hash = Hash.new
    domains.each do |d|
      domain = d.strip.split(" ")
      hash.store(domain[0], domain[1])
    end
    return hash
  end
end


if $PROGRAM_NAME == __FILE__
  LogParser.new(ARGV).print_log
end