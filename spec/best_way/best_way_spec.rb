require 'spec_helper'

RSpec.describe BestWay do
  describe '.calculated' do
    context 'when we choose a start and finish different' do
      it 'calculated itinerary a and f' do
        best_way = BestWay.new("a", "f")
        output = best_way.choose_closer_points
        expected = ["af", 5]
        expect(output).to eq(expected)
      end
      it 'calculated itinerary b and c' do
      end
    end
    context 'when we have an edge case' do
      context 'when start = a and finish = c' do
      end
      context 'when start = a and finish = f' do
      end
      context 'when start = b and finish = e' do
      end
      context 'when start = e and finish = f' do
      end
      context 'when start = f and finish = a' do
      end
    end
  end
end
