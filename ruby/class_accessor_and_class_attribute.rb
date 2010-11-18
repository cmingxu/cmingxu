require 'rubygems'
require 'active_support/all'

class Base
  cattr_accessor :accessor,:instance_writer => false
end

Base.accessor = "a"

class Subclass < Base
end



puts Subclass.accessor

Subclass.accessor = "b"
puts Subclass.accessor
puts Base.accessor

puts Base.new.accessor
puts Subclass.new.accessor

class Parent
  class_attribute :accessor
end

class Son < Parent
end

Parent.accessor = 1
puts Parent.accessor
puts Son.accessor
puts Son.new.accessor

Son.accessor = 2
puts Son.accessor 
puts Son.new.accessor
puts Parent.accessor
puts Parent.new.accessor
