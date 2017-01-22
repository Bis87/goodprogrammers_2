place_1 = {
    :ticket => 'РМ2010398 050298',
    :way => 'Москва → Петушки',
    :passenger => 'Венедикт В. Ерофеев',
    :passport => '45 99 505281'
}

place_2 = {
    :ticket => 'РМ2010399 050298',
    :way => 'Павловский Посад → Орехово-Зуево',
    :passenger => 'Иннокентий П. Шниперсон',
    :passport => '46 01 192872'
}

place_3 = {
    :ticket => 'РМ2010399 050298',
    :way => 'Москва → Владимир',
    :passenger => 'Иван В. Бунша',
    :passport => '47 33 912876'
}

carriage = [place_1, place_2, place_3]

a= 0
carriage.each do |i|

    puts "place # #{a += 1}"
  puts "ticket: #{i[:ticket]}"
  puts "way: #{i[:way]}"
  puts "passenger: #{i[:passenger]}"
  puts "passport: #{i[:passport]}"
  puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-"
end

