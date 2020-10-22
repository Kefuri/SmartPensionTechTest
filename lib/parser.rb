class LogParser
  def initialize(log)
    @log = log
  end

  def print_log
    log_array = create_log_array
    domain_hash = create_domain_hash(log_array)
    printsort_domains_by_visits(domain_hash)
    printsort_unique_domain_visits(domain_hash)
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
    sortedvisits = hash.sort_by { |_k, v| -v.length }
    sortedvisits.each do |domain|
      puts "#{domain[0]} #{domain[1].length}"\
     " #{domain[1].length > 1 ? 'visits' : 'visit'}"
    end
  end

  def printsort_unique_domain_visits(hash)
    hash.each do |domain|
      domain[1] = domain[1].uniq!
    end
    sortedvisits = hash.sort_by { |_k, v| -v.length }
    sortedvisits.each do |domain|
      puts "#{domain[0]} #{domain[1].length} unique"\
      " #{domain[1].length > 1 ? 'visits' : 'visit'}"
    end
  end

  private 

  def create_log_array
    lines = File.readlines(@log)
    return lines
  end
end

if $PROGRAM_NAME == __FILE__
  LogParser.new(ARGV[0]).print_log
end
