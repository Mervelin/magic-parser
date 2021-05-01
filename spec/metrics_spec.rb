describe Metrics do
  context 'when entries provided' do
    let(:entries) { [
      '/home 1.1.1.1',
      '/home 1.1.1.1',
      '/about 1.1.1.1'
    ]}

    describe '#popular_list' do
      subject(:popular) { Metrics.new(entries).popular }

      it 'returns the total amount of every entry present' do
        expect(popular["/home"]).to eql 2
      end
    end
  end
  
end