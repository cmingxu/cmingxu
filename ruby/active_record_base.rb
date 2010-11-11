require 'rubygems'
require 'active_record'

class ActiveRecord::Base
  scope :conditions,lambda {|*args| {:conditions => args}}
end

class Product < ActiveRecord::Base
  self.establish_connection({:adapter => :mysql,:username => "root",:password => "xcm",:database => "jmm_development"})
end


module Some1
  def b 
    puts "b"
  end
end

module Some
  def a
    puts "a"
  end
end


ActiveRecord::Base.extend Some

ActiveRecord::Base.class_eval do
  include Some1
end

Product.a
Product.new.b
