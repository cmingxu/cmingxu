#encoding UTF-8

require 'rubygems'
require "active_support/all"

class Parent < Object
  def inherited(base)
   p "ssssss"
  end
  cattr_accessor :sss
  class_inheritable_accessor :cia
end

class Son < Parent
end

Parent.sss = "sss"
p Parent.sss

p Son.sss
Son.sss = "son sss"
p Parent.sss


Son.cia = "ssss"
p Son.cia
p Parent.cia
