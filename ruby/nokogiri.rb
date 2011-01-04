require 'nokogiri'
require 'open-uri'



douban_uri = "http://douban.com"
content = open(douban_uri).read
doc = Nokogiri::HTML(content)

puts doc.content
