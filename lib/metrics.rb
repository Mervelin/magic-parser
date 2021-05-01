class Metrics
  def initialize(entries)
    @entries = entries
    @popular = {}
  end

  attr_reader :entries, :popular

  def popular_list
    entries.each do |entry|
      url = entry.split(' ').first

      if popular[url]
        popular[url] += 1
      else
        popular[url] = 1
      end
    end

    popular
  end
end