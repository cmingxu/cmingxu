# class variable ,child share the same mem location
class Parent
  @@class_var = []
  def self.class_var=(var)
    @@class_var = var
  end

  def self.class_var
    @@class_var
  end
end

class Son < Parent
end

class Daughter < Parent
end

Son.class_var = [1,2,3]

puts Son.class_var
puts Daughter.class_var
