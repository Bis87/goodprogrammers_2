class MemoDb < PostDb

  def read_from_console
    puts 'Напишите текст в консоль. Для завершения ввода введите end'

    line = nil

    while line != 'end'
      line = STDIN.gets.chomp
      @text = []
      @text << line

      @text.pop
    end

  end

  def save
    f = File.new(file_path, 'w:utf-8')

    time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")

    for i in @text do
      f.puts(i)
    end
    f.close

    puts 'запись сохранена'
  end

  def to_db_hash
    return super.merge(
        {
            'text' => @text.join('\n\r')
        }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @text = data_hash['text'].split('/n/r')
  end

end