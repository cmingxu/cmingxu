require 'rubygems'
require 'factory_girl'

class User
  attr_accessor :first_name,:email,:fake,:dake,:cake

  def save!
    true
  end
end

class Post
  attr_accessor :author
end

class Editor 
  attr_accessor :last_name
end

Factory.define :user,:class => User do |u|
  u.first_name "name"
  u.email "email"
  u.fake { 1+1}
  u.dake {|u| "#{u.first_name}, #{u.email}"}
end

puts Factory(:user).first_name
puts Factory(:user).fake
puts Factory(:user).dake

#Factory.define :post,:class => Post do |p|
#  p.author {|a| a.association(:editor,:last_name => "last_name")}
#end

#put Factory(:post).author.last_name

Factory.sequence :number do |n|
  n + 1
end

while(a = Factory.next :number) do
 puts a
end
