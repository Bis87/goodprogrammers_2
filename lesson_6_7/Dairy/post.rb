class Post
  def initialize
    @created_at = Time.now
    @text = nil
  end

  def self.post_types
    [MemoDb, TaskDb, LinkDb]
  end

  def self.create(type_index)
    return post_types[type_index].new
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

end