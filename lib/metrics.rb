require_relative './entry'
require_relative './metric'

class Metrics
  def initialize(entries)
    @entries = entries
    @popular = Metric.new
    @unique = Metric.new
    @paths = {}
  end

  def calculate
    entries.each do |line|
      entry = Entry.new(line)
      popular.increment(entry.url)
      calculate_unique(entry)
    end
  end

  def popular_list
    popular.list
  end

  def unique_list
    unique.list
  end

  private

  attr_reader :entries, :popular, :unique, :paths

  def calculate_unique(entry)
    return if path_visited?(entry)

    unique.increment(entry.url)

    add_path_to_visited(entry)
  end

  def path_visited?(entry)
    paths[entry.url]&.include?(entry.ip)
  end

  def add_path_to_visited(entry)
    (paths[entry.url] ||= []) << entry.ip
  end
end