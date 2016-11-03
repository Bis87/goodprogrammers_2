puts

greetings = {
    :morning => 'Good morning!',
    :day => 'Good day!',
    :evening => 'Good evening',
    :night => 'good night'
}

day_time = {
    (7...13) => :morning,
    (13...18) => :day,
    (18...24) => :evening,
    (0...7) => :night
}



puts greetings[day_time.select {|i| i === (Time.now.hour).to_i}.values.first]



day_time.each do |range, time_of_day|
  if range.include?(Time.now.hour)
    puts greetings[time_of_day]
  end

end