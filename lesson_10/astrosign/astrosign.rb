require 'json'
require 'date'

f = File.read('signs.json', encoding: 'utf-8')

signs = JSON.parse(f)

puts 'your birthday mm.dd'

input_data = STDIN.gets.chomp

input_birthday_date = Date.parse("#{input_data}.2000")

user_sign = nil

signs.each do |key, sign|

  dates = sign['dates'].split('..')

  if (Date.parse("#{dates[0]}.2000") <= input_birthday_date) && (Date.parse("#{dates[1]}.2000") >= input_birthday_date)

    user_sign = sign
  end

end

puts user_sign['dates']
puts user_sign['text']