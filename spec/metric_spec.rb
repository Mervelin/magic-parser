require './lib/metric'

describe Metric do
  subject(:metric) { Metric.new }

  describe '#increment' do
    let(:element) { 'abc' }

    it 'increases the count of element' do
      metric.increment(element)

      expect(metric.list).to eql ({ element => 1 })
    end
  end
end