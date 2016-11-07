require 'rexml/document'
require 'date'

puts "На что потратили деньги?"
expense_text = STDIN.gets.chomp

puts "Сколько потратили?"
expense_amount = STDIN.gets.chomp.to_i

puts "Укажите дату траты в формате ДД.ММ.ГГГГ, например 12.05.2003 (пустое поле - сегодня)"
date_input = STDIN.gets.chomp

expense_date = nil

if date_input == ''
  expense_date = Date.today
else
  begin
    expense_date = Date.parse(date_input)
  rescue ArgumentError # если дата введена неправильно, перехватываем исключение и выбираем "сегодня"
    expense_date = Date.today
  end
end

puts "В какую категорию занести трату"
expense_category = STDIN.gets.chomp

current_path = File.dirname(__FILE__)

file = current_path + '/expense.xml'

f = File.new(file, 'r+:UTF-8')

#doc = nil

begin
  doc = REXML::Document.new(f)
rescue REXML::ParceExeption => e
  puts 'XML битый'
  abort e.message
end

f.close

expenses = doc.elements.find('expenses').first

expense = expenses.add_element 'expense', {
    'amount' => expense_amount,
    'category' => expense_category,
    'date' => expense_date.strftime('%Y.%m.%d')
}

expense.text = expense_text

f = File.new(file, 'w:UTF-8')
doc.write(f, 2)
f.close

puts 'information successfully saved'
