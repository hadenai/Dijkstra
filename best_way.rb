Dir[File.dirname(__FILE__) + '/errors/*.rb'].sort.each { |file| require file }
require_relative '../best_way/best_way'

begin
  start = ARGV[0]
  finish  = ARGV[1]
  if start != 'a,b,c,d,e,f' || finish != 'a,b,c,d,e,f'
    raise ArgumentSignError
  end
rescue ArgumentError => e
  puts "#{e.class} -> #{e.message}"
end
