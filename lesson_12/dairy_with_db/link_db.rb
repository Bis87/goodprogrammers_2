class LinkDb < PostDb
  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts 'Введите адрес ссылки'

    @url = STDIN.gets.chomp

    puts 'Введите описание ссылки'

    @description = STDIN.gets.chomp

  end

  def save
    f = File.new(file_path, 'w:utf-8')
    time_string = @created_at.strftime('%Y,%m,%d, %H,%M')
    f.puts(time_string+"\n\r")

    f.puts @url
    f.puts @description
    f.close

    puts 'Ваша Ссылочка сохранена'
  end

  def to_strings

  end

  def to_db_hash
    return super.merge(
        {
            'text' => @text,
            'url' => @url
        }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @url = data_hash['url']
  end

end