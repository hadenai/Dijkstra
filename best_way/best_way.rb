require 'byebug'

class BestWay
  POSITION_GLOBAL =
    [
      { 'position_a' => { 'ab' => 8, 'ae' => 8, 'af' => 5 } },
      { 'position_b' => { 'ba' => 8, 'bc' => 4, 'bf' => 2 } },
      { 'position_c' => { 'cb' => 4, 'cd' => 10, 'cf' => 7 } },
      { 'position_d' => { 'dc' => 10, 'de' => 4, 'fd' => 8 } },
      { 'position_e' => { 'ed' => 4, 'ea' => 8 } },
      { 'position_f' => { 'fa' => 5, 'fb' => 2, 'fd' => 8, 'fc' => 7 } }
    ].freeze

  def initialize(first_position, last_position)
    @first_position = first_position
    @last_position = last_position
  end

  def choose_first_points
    first_points = @first_position.dig(@first_position.keys * '').min_by { |k, v| [v, k] }
  end

  def choose_second_points
    if choose_next_points.count > 1
      second_position = choose_next_points.select { |position| position.keys != @first_position.keys }
    end
    second_position = choose_next_points
    two_points = second_position.first.dig(second_position.first.keys * '').min_by { |k, v| [v, k] }
  end

  def choose_next_points
    BestWay::POSITION_GLOBAL.select do |position|
      choose_first_point = Hash[*choose_first_points.flatten(1)]
      position.values.first.has_key?((choose_first_point.keys * '').reverse)
    end
  end

  def add_the_smaller_points
    @itinerary = (@first_position.keys * '')[-1] + (@last_position.keys * '')[-1]
    @new_points = {}
    @current_position = choose_first_points.first[0] + choose_second_points.first[1]
    @new_points[@current_position] = choose_first_points.last + choose_second_points.last
    @first_position.values.first.dig(@itinerary)
    if @new_points.values.first < @first_position.values.first.dig(@itinerary)
      @first_position.values.first[@itinerary] = @new_points[@current_position]
    end
    @new_points
  end

  def choose_itineray
    choose_first_points
    add_the_smaller_points
    return choose_first_points if choose_first_points.first == @itinerary
    return @new_points if @new_points.keys * '' == @itinerary
  end
end
