class Book < Product

  def update(value)
    @book = value[:book]
    @author = value[:author]
  end

  def info
    "book: #{@book}; author: #{@author}"
  end

end