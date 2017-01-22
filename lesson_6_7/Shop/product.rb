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






