class Parent
#  def me
#    puts "this is in Parent"
#  end
end

module N
  def me
    puts "this in in M"
  end

end

module M
  include N
end


class Son < Parent
  include M
end
Son.new.me
