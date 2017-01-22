require_relative 'product.rb'
require_relative 'album.rb'
require_relative 'movie.rb'
require_relative 'book.rb'

total_price = 0
products = Product.read_from_xml('products.xml')
choice = nil

while choice != 'end'

  Product.show_products(products)

  puts "\n\r введите 'end' чтобы покинуть магазин"

  puts "\n\rВыберите товар"

  choice = STDIN.gets.chomp

  puts "Товар успешно приобретен. Цена товара #{products[choice.to_i].buy}"
  if choice != 'end'
    product = products[choice.to_i]

    total_price += (product.buy).to_i
  end

end

puts "thank for purchases. Amount is #{total_price}"


