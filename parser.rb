require './lib/parser'

if ARGV.length < 1
  puts "Too few arguments"
  exit
end

parser = Parser.new(ARGV.first)

parser.process_data

parser.print_popular_metrics

parser.print_unique_metrics