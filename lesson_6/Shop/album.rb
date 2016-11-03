class MusicAlbum < Product

  def update(value)
    @artist = value[:artist]
    @genre = value[:genre]
    @album = value[:album]
  end

  def info
    "artist name: #{@artist}; genre: #{@genre}; album: #{@album}"
  end

end
