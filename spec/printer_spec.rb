require './lib/printer'

describe Printer do
  let(:list) { [['apple', 2], ['orange', 1]] }
  let(:text) { 'sold' }

  subject(:print) { Printer.print(list, text) }
  describe '.print' do
    it 'prints entries with text appended' do
      expect { print }.to output("\"apple 2 sold\"\n\"orange 1 sold\"\n").to_stdout
    end
  end
end