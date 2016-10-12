puts 'Врага какого персонажа вы хотите узнать?'

hero = gets.chomp

heroes_antiheroes = {
    'batman' => 'joker',
    'sherlock' => 'moriarti',
    'buratino' => 'karabas-barabas',
}

heroes_antiheroes['mozart'] = 'saliery'

heroes_antiheroes.delete('mozart')

if heroes_antiheroes.has_key?(hero)
  puts "enemy of this hero is #{heroes_antiheroes[hero]}"
else
  puts "hash doesn`t contains this hero`"
end

puts heroes_antiheroes.keys