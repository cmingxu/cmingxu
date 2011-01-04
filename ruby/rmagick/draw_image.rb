require 'rubygems'
require 'RMagick'


include Magick

canvas = Magick::ImageList.new
canvas.new_image(250, 250, Magick::HatchFill.new('white', 'gray90'))
circle = Magick::Draw.new
circle.stroke('tomato')
circle.fill_opacity(0)
circle.stroke_opacity(0.75)
circle.stroke_width(6)
circle.stroke_linecap('round')
circle.stroke_linejoin('round')
circle.ellipse(canvas.rows/2,canvas.columns/2, 80, 80, 0, 315)
circle.polyline(180,70, 173,78, 190,78, 191,62)
circle.draw(canvas)

canvas.write("draw.jpg")
