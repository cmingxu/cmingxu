require 'rubygems'
require 'RMagick'
include Magick

images = ImageList.new("IMG_1059.JPG","IMG_1061.JPG","red_background.jpg")
images.write("animate.gif")

exit
