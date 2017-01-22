person = {
    :name => 'Vladislav',
    :age => '31',
    :wish => 'Study, Bitch!'
}




def happy_birthday(hash_param)
puts "*  *  *

Дорогой #{hash_param[:name]}!

Поздравляем Вас с днём рождения! Вам сегодня исполняется #{hash_param[:age]}.

Желаем #{hash_param[:wish]}"
end

happy_birthday(person)