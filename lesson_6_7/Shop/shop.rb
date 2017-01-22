require_relative 'product.rb'
require_relative 'album.rb'
require_relative 'movie.rb'
require_relative 'book.rb'

products = []

total_price = 0

product = Movie.new(100, 8)
product.update(:film => 'LEON', :director => 'BESSON', :year => '1994')
products.push(product)

product = Book.new(70, 3)
product.update(:book => 'Sherlock Holms', :author => 'Artur Conan Doyle')
products.push(product)

product = MusicAlbum.new(30, 9)
product.update(:artist => 'Marylin Manson', :album => 'Mechanical Animals', :genre => 'Metall')
products.push(product)

choice = nil

while choice != 'end'

  Product.show_products(products)

  puts "\n\r введите 'end' чтобы покинуть магазин"

  puts "\n\rВыберите товар"

  choice = STDIN.gets.chomp

  puts "Товар успешно приобретен. Цена товара #{products[choice.to_i].buy}"
  if choice != 'end'
    product = products[choice.to_i]

    total_price += product.buy
  end

end

puts "thank for purchases. Amount is #{total_price}"


