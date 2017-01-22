require 'rexml/document'
require 'date'

current_path = File.dirname(__FILE__)

file = current_path + '/card.xml'

abort 'Sorry, Master, file   expense.xml   does not exist' unless File.exist? file

f = File.new(file)

doc = REXML::Document.new(f)

f.close

card = {}

['name', 'age', 'profession', 'contact'].each do |row|
  card[row] = doc.root.elements[row].text
end

puts "#{card["name"]}"
puts "#{card["age"]}"
puts "#{card["profession"]}"
puts "#{card["contact"]}"