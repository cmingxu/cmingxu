require 'rubygems'
require 'RMagick'
include Magick

image = ImageList.new("photo.jpg")
small_image = image.minify
#small_image.display
small_image.write("photo_small.gif")
exit
