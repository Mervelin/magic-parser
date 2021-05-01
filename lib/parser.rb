require_relative './metrics'
require_relative './printer'

class Parser
  def initialize(path)
    @path = path
  end

  def process_data
    metrics.calculate
  end

  attr_reader :path

  def entries
    File.readlines(path).map(&:chomp)
  end

  def print_popular_metrics
    Printer.print(ordered_descending_popular, 'visits')
  end

  def print_unique_metrics
    Printer.print(ordered_descending_unique, 'unique views')
  end

  private

  def metrics
    @metrics ||= Metrics.new(entries)
  end

  def ordered_descending_popular
    order_descending(metrics.popular_list)
  end

  def ordered_descending_unique
    order_descending(metrics.unique_list)
  end

  def order_descending(list)
    list.sort_by { |_k, v| v }.reverse
  end
end