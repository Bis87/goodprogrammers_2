class Parent
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def obedient
    true
  end

end

class Child < Parent
  def initialize(name)
    super
  end

  def name
    @name
  end

  def obedient
    false
  end
end

petruha = Parent.new('Petruha')

petrovi4 = Child.new('Pavluha')

puts petruha.name

puts petruha.obedient

puts petrovi4.name

puts petrovi4.obedient
