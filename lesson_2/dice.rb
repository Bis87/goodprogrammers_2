puts "how many dice?"

number = gets.to_i

dice_summ = 0

number.times do
  dice = rand(6) + 1
  puts dice

  dice_summ += dice
end

puts "Your scores: #{dice_summ}"