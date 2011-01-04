module A
  @@aa  = 2
end

class B
  include A

  @@aa = 1
end


class C
  include A
  puts @aa
end


