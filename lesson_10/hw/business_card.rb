require 'json'

f = File.read('card.json', encoding: 'utf-8')

info = JSON.parse(f)

puts info['name']
puts info['age']
puts info['profession']