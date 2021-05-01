require './lib/metric'

describe Metric do
  subject(:metric) { Metric.new }

  describe '#increment' do
    let(:element) { 'abc' }

    it 'increases the count of element' do
      metric.increment(element)

      expect(metric.list).to eql ({ 'abc' => 1 })
    end
  end

  describe '#order_descending' do
    let(:first_element) { 'abc' }
    let(:second_element) { 'def' }

    before do
      metric.increment(first_element)
      metric.increment(second_element)
      metric.increment(second_element)
    end

    it 'returns elements ordered descending based on value' do
      expect(metric.order_descending).to eql ({ 'def' => 2, 'abc' => 1 })
    end
  end
end