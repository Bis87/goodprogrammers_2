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

f = File.new(file, 'r:UTF-8')

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
#
#amount_by_day = Hash.new
#
#doc.elements.each('expenses/expense') do |i|
#
#  loss_sum = i.attributes['amount'].to_i
#
#  loss_date = Date.parse(i.attributes['date'])
#
#  amount_by_day[loss_date] ||= 0
#
#  amount_by_day[loss_date] += loss_sum
#end
#
#f.close
#
#sum_by_month = Hash.new
#
#
#amount_by_day.keys.sort.each do |key|
#
#  sum_by_month[key.strftime('%B %Y')] ||= 0
#
#  sum_by_month[key.strftime('%B %Y')] += amount_by_day[key]
#
#end
#
#
#
#puts amount_by_day
#
#puts "\n******************************************\n"
#
#puts sum_by_month
#
#current_month = amount_by_day.keys.sort[0].strftime('%B %Y')
#
#puts "------[ #{current_month}, total loss: #{sum_by_month[current_month]} $. ]--------"
#
#amount_by_day.keys.sort.each do |key|
#  if key.strftime('%B %Y') != current_month
#
#    current_month = key.strftime('%B %Y')
#
#    puts "------[ #{current_month}, total loss: #{sum_by_month[current_month]} $. ]--------"
#  end
#
#  puts "\t #{key.day}: #{amount_by_day[key]} $"
#
#end