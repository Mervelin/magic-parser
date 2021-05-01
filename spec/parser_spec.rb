require './lib/parser'

describe Parser do
  context 'when proper path is provided' do
    let(:path) { './spec/fixtures/test.log' }

    describe '#entries' do
      subject(:entries) { Parser.new(path).entries }
      it 'retrieves entries from File' do
        expect(entries.first).to eql '/home 1.1.1.1'
      end

      it 'returns entries without newline characters' do
        expect(entries.first).not_to include "\n"
      end
    end
  end
end