$a = nil

b = nil

def method
  c = nil
  puts defined? $a

  puts defined? b

  puts defined? c
end

method

puts defined? $a

puts defined? b

puts defined? c



