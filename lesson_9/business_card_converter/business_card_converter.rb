require 'rexml/document'

current_path = File.dirname(__FILE__)

file = current_path + '/business_card.xml'

abort 'Sorry, Master, file   business_card.xml   does not exist' unless File.exist? file

f = File.new(file)

doc = REXML::Document.new(f)

f.close

card = {}

%w(first_name second_name last_name phone email skills photo).each do |i|
  card[i] = doc.root.elements[i].text
end
#создаем новый документ
html = REXML::Document.new

# добавляем корневой элемент документа - html,
# в нем сразу же создаем атрибут lang со значением en
html.add_element('html', {'lang' => 'en'})

# html - корневой элемент(самый верхний). к нему добавляем head и body элементы.
html.root.add_element('head').add_element('meta', {'charset' => 'UTF-8'})

body = html.root.add_element('body')

body.add_element('p').add_element('img', {'src' => card['photo']})

body.add_element('h1').add_text(
                          "#{card['first_name']} #{card['second_name']} #{card['last_name']}")

body.add_element('p').add_text("Phone number: #{card['phone']}")
body.add_element('p').add_text("Email address: #{card['email']}")
body.add_element('p').add_text("Actual skills: #{card['skills']}")

html_file_path = current_path + '/business_card.html'

f = File.new(html_file_path, 'w:UTF-8')

f.puts('<!DOCTYPE HTML>')

html.write(f, 2)

f.close