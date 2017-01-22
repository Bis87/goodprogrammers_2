carriage = [
    {
        :ticket => 'РМ2010398 050298',
        :way => 'Москва → Петушки',
        :passenger => 'Венедикт В. Ерофеев',
        :passport => '45 99 505281'
    },
    {
        :ticket => 'РМ2010399 050298',
        :way => 'Павловский Посад → Орехово-Зуево',
        :passenger => 'Иннокентий П. Шниперсон',
        :passport => '46 01 192872'
    },
    {
        :ticket => 'РМ2010399 050298',
        :way => 'Москва → Владимир',
        :passenger => 'Иван В. Бунша',
        :passport => '47 33 912876'
    }
]

carriage.each_with_index do |passenger, index|
  puts "place in carriage #{index + 1}"

  puts "ticket: #{passenger[:ticket]}"
  puts "way: #{passenger[:way]}"
  puts "passenger: #{passenger[:passenger]}"
  puts "passport: #{passenger[:passport]}"
end