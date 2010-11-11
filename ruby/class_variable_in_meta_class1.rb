class Parent
end

class Son < Parent
end

class Daughter < Parent
end

class << Parent
  attr_accessor :class_variable
end

Parent.class_variable = [1]
puts Parent.class_variable

Son.class_variable = [2]
puts Son.class_variable
puts Parent.class_variable
