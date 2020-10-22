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
  
  context "#create_domain_hash" do
    it "should create a hash" do
      log = ""
      parser = LogParser.new(log)
      hash = parser.create_domain_hash(["empty"])
      expect(hash).to be_a(Hash)
    end
        
    it "should take an array and create a hash with the domain" do
      logfile = ""
      parser = LogParser.new(logfile)
      array = ["/domainname 192.111.111.111"]
      hash = parser.create_domain_hash(array)
      expect(hash.keys[0]).to eq("/domainname")
    end

    it "should take an array and create a key pair with each item" do
      logfile = ""
      parser = LogParser.new(logfile)
      array = ["/domainname 192.111.111.111", "/domainname2 192.111.111.111"]
      hash = parser.create_domain_hash(array)
      expect(hash.length).to eq(2)
    end

    it "should not create duplicate entries for domain names that are the same" do
      logfile = ""
      parser = LogParser.new(logfile)
      array = ["/domainnameone 192.111.111.111", "/domainnameone 192.111.111.111"]
      hash = parser.create_domain_hash(array)
      expect(hash.length).to eq(1)
    end

    it "should create an array as the value pair of the domain name" do
      logfile = ""
      parser = LogParser.new(logfile)
      domain = "/domainname"
      ip = "192.111.111.111"
      array = [domain + " " + ip]
      hash = parser.create_domain_hash(array)
      expect(hash[domain]).to be_an(Array)
    end

    it "should store the domain's IP inside the array" do
      logfile = ""
      parser = LogParser.new(logfile)
      domain = "/domainname"
      ip = "192.111.111.111"
      array = [domain + " " + ip]
      hash = parser.create_domain_hash(array)
      expect(hash[domain][0]).to eq(ip)
    end

    it "should store two IPs inside the domain's array" do
      logfile = ""
      parser = LogParser.new(logfile)
      domain = "/domainname"
      ip1 = "192.111.111.111"
      ip2 = "192.111.111.112"
      array = [domain + ' ' + ip1, domain + ' ' + ip2]
      hash = parser.create_domain_hash(array)
      expect(hash[domain].length()).to eq(2)
      expect(hash[domain][0]).to eq(ip1)
      expect(hash[domain][1]).to eq(ip2)
    end

    it "should store an IP in each unique domain" do
      logfile = ""
      parser = LogParser.new(logfile)
      domain1 = "/domainnameone"
      domain2 = "/domainnametwo"
      ip1 = "192.111.111.111"
      array = [domain1 + ' ' + ip1, domain2 + ' ' + ip1]
      hash = parser.create_domain_hash(array)
      expect(hash.length()).to eq(2)
      expect(hash[domain1]).to eq([ip1])
      expect(hash[domain2]).to eq([ip1])
    end

    it "should store multiple IPs for each unique domain" do
      logfile = ""
      parser = LogParser.new(logfile)
      domain1 = "/domainnameone"
      domain2 = "/domainnametwo"
      ip1 = "192.111.111.111"
      ip2 = "192.111.111.112"
      array = [domain1 + ' ' + ip1, domain2 + ' ' + ip2, domain2 + ' ' + ip1, domain1 + ' ' + ip2]
      hash = parser.create_domain_hash(array)
      expect(hash.length()).to eq(2)
      expect(hash[domain1].length).to eq(2)
      expect(hash[domain2].length).to eq(2)
    end
  end

  context "#printsort_domains_by_visits" do
    it "should print the first item in the hash" do
      logfile=""
      parser = LogParser.new(logfile)
      hash = parser.create_domain_hash(["/domainname 192.111.111.111"])
      expect { parser.printsort_domains_by_visits(hash) }.to output("/domainname 1 visit\n").to_stdout
    end

    it "should print the two items in the hash" do
      logfile=""
      parser = LogParser.new(logfile)
      hash = parser.create_domain_hash(["/domainname 192.111.111.111", "/domainnametwo 192.111.111.111"])
      expect { parser.printsort_domains_by_visits(hash) }.to output("/domainname 1 visit\n/domainnametwo 1 visit\n").to_stdout
    end
  end



end