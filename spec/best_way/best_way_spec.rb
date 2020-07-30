require 'spec_helper'

RSpec.describe BestWay do
  describe '.choose_itineray' do
    let(:position_a) { { 'position_a' => { 'ab' => 8, 'ad' => 10, 'af' => 5, 'ae' => 8 } } }
    let(:position_b) { { 'position_b' => { 'ba' => 8, 'bc' => 4, 'bf' => 2 } } }
    let(:position_c) { { 'position_c' => { 'cb' => 4, 'cd' => 10, 'cf' => 7 } } }
    let(:position_d) { { 'position_d' => { 'dc' => 10, 'de' => 4, 'fd' => 8, 'da' => 10 } } }
    let(:position_e) { { 'position_e' => { 'ed' => 4, 'ea' => 8 } } }
    let(:position_f) { { 'position_f' => { 'fa' => 5, 'bf' => 2, 'fd' => 8, 'fc' => 7 } } }

    context 'when we choose a first_position and last_position different' do
      it 'calculated itinerary a and f' do
        best_way = BestWay.new(position_a, position_f)
        output = best_way.choose_itineray
        expected = ['af', 5]
        expect(output).to eq(expected)
      end
      it 'calculated itinerary a and b' do
        best_way = BestWay.new(position_a, position_b)
        output = best_way.choose_itineray
        expected = { 'ab' => 7 }
        expect(output).to eq(expected)
      end
    end
    it 'calculated itinerary c and f' do
      best_way = BestWay.new(position_c, position_f)
      output = best_way.choose_itineray
      expected = { 'cf' => 6 }
      expect(output).to eq(expected)
    end
  end
end
