require 'sqlite3'

class PostDb

  @@SQLITE_DB_FILE = '../notepad.sqlite'

  def self.post_types
    {'Memo' => MemoDb, 'Task' => TaskDb, 'Link' => LinkDb}
  end

  def self.create(type)
    return post_types[type].new
  end

  def self.find(limit, type, id)
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)

    if id != nil
      db.results_as_hash = true # настройка соединения к базе, он результаты из базы преобразует в Руби хэши

      # выполняем наш запрос, он возвращает массив результатов, в нашем случае из одного элемента
      result = db.execute("SELECT * FROM posts WHERE  rowid = ?", id)

      puts 1
      puts result[0]

      # получаем единственный результат (если вернулся массив)
      result = result[0] if result.is_a? Array
      db.close

      if result.empty?
        puts "Такой id #{id} не найден в базе :("
        return nil
      else
        # создаем с помощью нашего же метода create экземпляр поста,
        # тип поста мы взяли из массива результатов [:type]
        # номер этого типа в нашем массиве post_type нашли с помощью метода Array#find_index
        post = create(result['type'])

        #   заполним этот пост содержимым
        post.load_data(result)

        # и вернем его
        return post
      end
    end
  end

  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console

  end

  def to_strings

  end

  def save
    f = File.new(file_path, 'w:utf-8')

    for i in to_strings do
      f.puts i
    end

    f.close

  end

  def file_path

    current_path = File.dirname(__FILE__)

    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M_%S.txt")

    return current_path + '/' + file_name
  end

  def save_to_db
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)
    db.results_as_hash = true

    db.execute(
        "INSERT INTO posts (" +
            to_db_hash.keys.join(',') +
            ")" +
            " VALUES (" +
            ('?,'*to_db_hash.keys.size).chomp(',') +
            ")",
        to_db_hash.values
    )

    insert_row_id = db.last_insert_row_id

    db.close

    return insert_row_id
  end

  def to_db_hash
    {
        'type' => self.class.name,
        'created_at' => @created_at.to_s
    }
  end

  def load_data(data_hash)
    @created_at = Time.parse(data_hash['created_at'])
  end

end