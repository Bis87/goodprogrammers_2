class Movie < Product

  def update(value)
    @director = value[:director]
    @year = value[:year]
    @film = value[:film]
  end

  def info
    "director: #{@director}; year: #{@year}; film: #{@film}"
  end

end