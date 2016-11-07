class Memo < Post

  def read_from_console
    puts 'Напишите текст в консоль. Для завершения ввода введите end'

    line = nil

    while line != 'end'
      line = STDIN.gets.chomp

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

end