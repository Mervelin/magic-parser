class Printer
  def self.print(list, text)
    list.each do |url, count|
      p "#{url} #{count} #{text}"
    end
  end
end