
puts "choose string or number? (print 'string'/'number')"

string_or_number = gets.chomp

puts 'please, enter number or string to count bytes.'



input = gets.chomp



if string_or_number == 'string'
  puts "It is #{input.bytesize} bytes in string #{input}"
else
  puts "It is #{input.to_i.size} bytes in number #{input}"
end