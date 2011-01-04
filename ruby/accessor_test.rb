class A
  def test_public
    puts "test_public"
  end

  protected
  def test_protected
    puts "test_protected"
  end

  private 
  def test
    puts "test"
  end
end


class B < A
  def b_test_protected
    self.test_protected
  end

  def b_test
    self.test
  end
end
B.new.b_test_protected

A.new.test_public
A.new.test_protected
A.new.test

B.new.test_public
B.new.test_protected
B.new.test
