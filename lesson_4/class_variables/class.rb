a = nil

class B
  def initialize
    @b = nil
  end

  def check_variables
    puts defined? a

    puts defined? @b
  end

end


b = B.new

b.check_variables

puts defined? a

puts defined? @b