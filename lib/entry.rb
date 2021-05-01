class Entry
  def initialize(line)
    entry = line.split(' ')
    @url = entry.first
    @ip = entry.last
  end

  attr_reader :url, :ip
end