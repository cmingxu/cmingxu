require 'rubygems'
require 'RMagick'

include Magick

f = ImageList.new("IMG_1059.JPG","IMG_1061.JPG","red_background.jpg")

f.animate
exit
