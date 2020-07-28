require 'byebug'

class BestWay
POSITION_A = {"ab" => 8, "ea"=> 8, "af" => 5, "ae" => 10}
POSITION_B = {"ab" => 8, "bc" => 4, "bf" => 2}
POSITION_C = {"bc" => 4, "cd" => 10, "de" => 4, "fc" => 7}
POSITION_D = {"cd" => 10, "de" => 4, "fd" => 8}
POSITION_E = {"de" => 4, "ea"=> 8, "ae" => 10}
POSITION_F = {"af" => 5, "bf" => 2, "fd" => 8, "fc" => 7}
  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def choose_closer_points
       BestWay::POSITION_A.sort_by { |key, value| value }.first
  end

end
