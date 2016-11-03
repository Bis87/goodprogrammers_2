require 'digest'

puts 'please, enter a phrase to encryption:'

phrase = gets.chomp

puts 'choose the way of encryption:'

puts '1. MD5'
puts '2. SHA1'
puts '3. SHA2'

encryption = gets.chomp

case encryption
  when '1'
    puts Digest::MD5.digest phrase
  when '2'
    puts Digest::SHA1.digest phrase
  when '3'
    puts Digest::SHA2.digest phrase
  else
    puts 'choose correct encryption'
end

