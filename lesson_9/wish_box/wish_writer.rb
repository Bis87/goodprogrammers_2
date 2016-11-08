require 'rexml/document'
require 'date'


time= Time.now
formatted_time = time.strftime('%d-%m-%Y')



puts "В этом сундуке храняться ваши желания."
puts "Чего бы вы хотели?"

wish_text = STDIN.gets.chomp

puts "До какого числа вы хотите осуществить это желание?"
puts "Укажите дату в формате ДД.ММ.ГГГГ"

date_input = STDIN.gets.chomp

if date_input == ''
  wish_date = formatted_time
else
  begin
    wish_date = Date.parse(date_input)
  rescue ArgumentError
    wish_date = formatted_time
  end
end

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

wishes = doc.elements.find('wishes').first

wishes.add_element 'wish',
                   {
                       'text' => wish_text,
                       'date' => wish_date.strftime('%d-%m-%Y')
                   }


f = File.new(file, 'w:UTF-8')
doc.write(f, 2)
f.close

puts "Ваше желание в сундуке"