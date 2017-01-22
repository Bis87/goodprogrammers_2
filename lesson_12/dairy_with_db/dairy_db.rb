require_relative 'post_db.rb'
require_relative 'memo_db.rb'
require_relative 'link_db.rb'
require_relative 'task_db.rb'

puts 'Я блокнот'

puts 'Выберите тип записи'

# puts "db: #{DB.test_connection}"

choices = PostDb.post_types.keys

choice = -1

until choice >= 0 && choice < choices.size

  choices.each_with_index do |type, index|
    puts "\t#{index}, #{type}"
  end

  choice = gets.chomp.to_i

end

entry = PostDb.create(choices[choice])

entry.read_from_console

id = entry.save_to_db

puts id