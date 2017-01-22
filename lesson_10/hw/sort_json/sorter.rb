require 'json'

f = File.read('lamguages.json', encoding:'utf-8')

info = JSON.parse(f)

sorted_info = info.sort_by {|lang, quty| -quty}.to_h

most_popular = sorted_info.to_a.first
puts "Самый популярный язык: #{most_popular[0]} (#{most_popular[1]})"

puts sorted_info.class

sorted_info.each_with_index do |lang, i|
  puts "#{i+1}: #{lang[0]} (#{lang[1]})"
end