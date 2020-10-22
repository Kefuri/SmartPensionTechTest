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
      if hash.key?(domain[0])
        hash[domain[0]] << domain[1]
        next
      end
      hash.store(domain[0], [domain[1]])
    end
    return hash
  end

  def printsort_domains_by_visits(hash)
    sortedvisits = hash.sort_by {|k, v| -v.length}
    sortedvisits.each do |domain|
      puts "#{domain[0]} #{domain[1].length} #{domain[1].length > 1 ? 'visits' : 'visit'}"
    end
  end

  def printsort_unique_domain_visits(hash)
    hash.each do |domain|
      domain[1] = domain[1].uniq!
    end
    sortedvisits = hash.sort_by {|k, v| -v.length}
    sortedvisits.each do |domain|
      puts "#{domain[0]} #{domain[1].length} unique #{domain[1].length > 1 ? 'visits' : 'visit'}"
    end
  end
end



if $PROGRAM_NAME == __FILE__
  LogParser.new(ARGV).print_log
end