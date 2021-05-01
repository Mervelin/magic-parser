require './lib/entry'

describe Entry do
  context 'when provided with proper line from log file' do
    let(:line) { '/home 1.1.1.1' }

    subject(:entry) { Entry.new(line) }

    describe '#url' do
      it 'returns first part of line' do
        expect(entry.url).to eql '/home'
      end
    end

    describe '#ip' do
      it 'returns second part of line' do
        expect(entry.ip).to eql '1.1.1.1'
      end
    end
  end
end