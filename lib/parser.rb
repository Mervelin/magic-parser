class Parser
  def initialize(path)
    @path = path
  end

  attr_reader :path

  def entries
    File.readlines(path)
  end
end