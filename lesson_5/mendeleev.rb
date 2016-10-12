table = {
    'H' => 'Kavendish',
    'He' => 'Lokier, Zhansen, Rumzay',
    'Li' => 'Arfvedson',
    'Be' => 'Waklen',
    'B' => 'Devy and Gay-Lussak'
}

puts "We`v got #{table.keys.size} elements"

puts table.keys

element = gets.chomp

if table.has_key?(element)
  puts "Element's founder: #{table[element]}"
else
  "Sorry we don`t know yet what is that"
end