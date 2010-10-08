class Pro

  def self.ef
    class << self
      self
    end
  end

  def ef
    class << self
      self
    end
  end


  def inspect
    "dddddddd"
  end

  def self.inspect
    "ssssssss"
  end
end


p Pro.ef
p Pro.new.ef
