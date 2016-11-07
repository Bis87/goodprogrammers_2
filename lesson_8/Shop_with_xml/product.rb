class Product
  def initialize(price, quantity)
    @quantity = quantity
    @price = price
  end

  def self.show_products(products)

    puts "Что вы хотите купить?"
    puts ""

    products.each_with_index do |product, index|
      puts "#{index}: #{product.show}"
    end

  end

  def self.read_from_xml(file_name)

    require 'rexml/document'

    current_path = File.dirname(__FILE__) + '/xml_files/' + file_name

    product = nil
    products = []

    f = File.new(current_path)
    doc = REXML::Document.new(f)
    f.close

    doc.elements.each('products/product') do |i|
      price = i.attributes['price'].to_i
      amount_available = i.attributes['amount_available'].to_i

      i.each_element('music_album') do |el|
        product = MusicAlbum.new(price, amount_available)
        product.update(:artist => el.attributes['artist'],
                       :album => el.attributes['album'],
                       :genre => el.attributes['genre'])
      end

      i.each_element('movie') do |el|
        product = Movie.new(price, amount_available)
        product.update(:film => el.attributes['film'],
                       :director => el.attributes['director'],
                       :year => el.attributes['year'])
      end

      i.each_element('book') do |el|
        product = Book.new(price, amount_available)
        product.update(:book => el.attributes['book'],
                       :author => el.attributes['author'])
      end

      products.push(product)
    end


    return products
  end

  def buy
    if @quantity > 0
      @quantity -= 1
      @price
    else
      puts 'больше нет'
      0
    end
  end

  def show
    "#{info}  price #{@price}; quantity: #{@quantity}"
  end

  def check_price
    @price
  end

  def update

  end

  def info

  end

end






