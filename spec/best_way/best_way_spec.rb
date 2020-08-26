require 'spec_helper'

RSpec.describe BestWay do
  describe '.choose_itineray' do
    context 'when we choose a first_position and last_position different' do
      it 'calculated itinerary a and e' do
        best_way = BestWay.new([0, 5, 0, 0, 9], [[9, 0, 8, 0, 4]])
        output = best_way.search_first_edges
        expect(output).to eq("The shortest route is 11")
      end
    end
  end
end
