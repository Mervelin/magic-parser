class Metric
  def initialize
    @list = {}
    list.default_proc = proc { 0 }
  end
  
  attr_accessor :list

  def increment(element)
    list[element] += 1
  end
end