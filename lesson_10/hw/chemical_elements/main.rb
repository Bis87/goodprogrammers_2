require 'json'

f = File.read('elements.json', encoding:'utf-8')

elements = JSON.parse(f)

puts "We`v got #{elements.keys.size} elements"

elements.each_with_index { |v,i| puts "#{i+1}, #{(v[1])['name']}" }

element = gets.chomp

if elements.has_key?(element)

  el = elements[element]
  puts "Element's name: #{el['name']}"
  puts "Element's latin name: #{el['latin']}"
  puts "Element's period_group: #{el['period_group']}"
  puts "Element's atomic_mass: #{el['atomic_mass']}"
  puts "Element's density: #{el['density']}"
  puts "Element's melt_temp: #{el['melt_temp']}"
  puts "Element's freeze_temp: #{el['freeze_temp']}"
  puts "Element's year: #{el['year']}"
  puts "Element's discoverer: #{el['discoverer']}"
  puts "Element's pronunciation: #{el['pronunciation']}"
else
  "Sorry we don`t know yet what is that"
end