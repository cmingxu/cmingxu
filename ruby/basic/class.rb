module Test
  class Aclass
  end
end

class_object = Class.new(Test::Aclass)
puts class_object


class_object.class_eval do
  def method_of_class_object
    puts "in method_of_class_object"
  end
end


puts class_object.instance_methods(false)


class_object1 = Class.new(Test::Aclass)
puts class_object1

class_object1.class_eval do
  def method_of_class_object1
    puts "in method_of_class_objecta111"
  end
end


puts class_object1.instance_methods(false)
