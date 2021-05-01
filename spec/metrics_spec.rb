require './lib/metrics'

describe Metrics do
  context 'when entries provided' do
    let(:entries) { [
      '/home 1.1.1.1',
      '/home 1.1.1.1',
      '/about 1.1.1.1'
    ]}

    subject(:metrics) { Metrics.new(entries) }

    before do
      metrics.calculate
    end

    describe '#popular_list' do
      it 'returns the total amount of every entry present' do
        popular_list = metrics.popular_list
        expect(popular_list["/home"]).to eql 2
        expect(popular_list["/about"]).to eql 1
      end
    end

    describe '#unique_list' do
      it 'returns the total amount of every unique entry' do
        unique_list = metrics.unique_list
        expect(unique_list["/home"]).to eql 1
        expect(unique_list["/about"]).to eql 1
      end
    end
  end
end