require 'rexml/document'
require 'date'

current_path = File.dirname(__FILE__)

file = current_path + '/wishes.xml'

f = File.new(file, 'r:UTF-8')

begin
  doc = REXML::Document.new(f)
rescue REXML::ParseExeption => e
  puts 'XML Corrupted'
  abort e.message
end

f.close

wishes = []

doc.elements.each('wishes/wish') do |i|

  wishes.push({
      text: i.attributes['text'],
      date: Date.parse(i.attributes['date'])
              })
  end

def print_wish(hash)
  puts "#{hash[:date].strftime("%d.%m.%Y")}: #{hash[:text]}"
end

puts 'Эти желания должны были сбыться'

wishes.each do |i|
  print_wish(i) if i[:date] < Date.parse((Time.now).to_s)
end

puts 'А этим желаниям ещё предстоит сбыться'

wishes.each do |i|
  print_wish(i) if i[:date] > Date.parse((Time.now).to_s)
end