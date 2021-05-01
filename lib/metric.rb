class Metric
  def initialize
    @list = {}
    list.default_proc = proc { 0 }
  end

  def increment(element)
    list[element] += 1
  end

  attr_accessor :list
end