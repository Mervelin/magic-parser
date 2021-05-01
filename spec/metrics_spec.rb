require './lib/metrics'

describe Metrics do
  context 'when entries provided' do
    let(:entries) { [
      '/home 1.1.1.1',
      '/home 1.1.1.1',
      '/about 1.1.1.1'
    ]}

    describe '#popular_list' do
      subject(:popular_list) { Metrics.new(entries).popular_list }

      it 'returns the total amount of every entry present' do
        expect(popular_list["/home"]).to eql 2
      end
    end
  end
  
end