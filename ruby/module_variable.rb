module TobeIncluded
  attr_accessor :var

  def initialize
    @var = 1
  end

  def fun1
    puts @var
    puts "fun1"
  end

  def self.included(base)
    base.class_eval do
      attr_accessor :var_in_class_eval
      @var_in_class_eval = 3 
    end
  end
end

class Test
  include TobeIncluded
  def fun2
    puts @var
  end
end

Test.new.fun1

Test.new.fun2

t = Test.new
puts Test.var_in_class_eval
#t.var_in_class_eval = 2
puts t.var_in_class_eval
