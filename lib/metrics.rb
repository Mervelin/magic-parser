require_relative './entry'
require_relative './metric'

class Metrics
  def initialize(entries)
    @entries = entries
    @popular = Metric.new
    @unique = Metric.new
    @paths = {}
  end

  def popular_list
    entries.each do |line|
      entry = Entry.new(line)

      popular.increment(entry.url)
    end

    popular.list
  end

  def unique_list
    entries.each do |line|
      entry = Entry.new(line)

      calculate_unique(entry)
    end

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