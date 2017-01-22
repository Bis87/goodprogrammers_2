require 'date'

class TaskDb < PostDb
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts 'что вы хотите сделать'

    @text = STDIN.gets.chomp

    puts 'введите дату завершения ДД.ММ.ГГГГ'

    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def save
    f = File.new(file_path, 'w:utf-8')
    time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
    f.puts(time_string + "\n\r")

    f.puts("Сделать до #{@due_date.strftime("%Y.%m.%d")}")
    f.puts(@text)

    f.close

    puts 'Ваша задача сохранена'

  end

  def to_strings

  end

  def to_db_hash
    return super.merge(
                    {
                        'text' => @text,
                        'due_date' => @due_date.to_s
                    }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @due_date = Date.parse(data_hash['due_date'])
  end

end