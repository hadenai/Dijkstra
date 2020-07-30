Dir[File.dirname(__FILE__) + '/errors/*.rb'].sort.each { |file| require file }
require_relative './best_way/best_way'

begin
  first_position = ARGV[0]
  last_position  = ARGV[1]
  # if first_position !=
  # 'position_a, position_b, position_c, position_d, position_e, position_f' ||
  #   last_position != 'position_a, position_b, position_c, position_d, position_e, position_f'
  #   raise ArgumentSignError
  # end
  best_way = BestWay.new(first_position, last_position)
  puts best_way.choose_itineray
rescue ArgumentError => e
  puts "#{e.class} -> #{e.message}"
end
