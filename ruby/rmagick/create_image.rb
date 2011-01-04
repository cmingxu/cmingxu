require 'rubygems'
require 'RMagick'

include Magick

f = Image.new(200,200) {self.background_color = 'red'}
f.write("red_background.jpg")
exit


