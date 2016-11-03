food = {
    :apple => 2,
    :meat => 5,
    :milk => 4,
    :cheese => 6
}

instruments = {
    :hammer => 7,
    :screw_driver => 3,
    :nails => 100,
    :screws => 1000
}

purchases = food.merge(instruments)

purchases.each {|key, value| puts "#{key}: #{value}"}