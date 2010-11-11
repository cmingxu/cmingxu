# == when subclass inhrited from super class ,
# == super class's meta class also got inhrited
class Parent
  class << self
    attr_accessor :class_variable
  end
end

class Son < Parent
end

class Daughter < Parent
end
Son.class_variable = "class variable"
puts Son.class_variable

Daughter.class_variable = "daughter variable"
puts Daughter.class_variable


puts Son.class_variable
puts Parent.class_variable

