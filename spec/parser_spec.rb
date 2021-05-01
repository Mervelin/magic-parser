require './lib/parser'

describe Parser do
  context 'when proper path is provided' do
    let(:path) { './spec/fixtures/test.log' }

    it 'retrieves entries from File' do
      entries = Parser.new(path).entries

      expect(entries.first).to eql '/home 1.1.1.1'
    end
  end
end