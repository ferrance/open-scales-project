
D = 6         # diameter of bit
X = 160       # width of rectangle (x axis)
Y = 45        # ht of rectangle (y axis)
STEP = 0.35    # percent overlap of cuts
SPEED = 600   # speed in mm/s
ZOFS = 0      # if positive, move up this amt before cutting

# origially did 145x140 to to all of scale except edges
#   but this doesn't work if you have to mill both sides
#
# to do a whole scale use 155x45

# make a rectangle at whatever height the spindle is at when
# you run this
#
# this is meant to work with the 3d printed fixtures
# the purpose of the fixture it to contain the stock and 
# to lower it a fixed depth. So for example, for the manix
# scales, it might lower it by 2.8mm. If you sand or cut
# the scale so that it is level with the fixture, it will
# have the thickness of the fixture.
#
# wherever we are when we start this gcode, that's the origin
# which will be the lower left corner of the rectangle
#
# Note that this means we are zeroing off the fixture, not the
# top of the piece
#
# I finally found a good way to do this. Secure a block
# and plane the top of it. Then cover the block and the work
# piece with tape. Use super glue to adhere the two together.
# then you can plane the work piece.

puts "G90"
puts "G10 L20 P0 X0 Y0 Z0"

# lift up if necessary
if (ZOFS>0)
  puts "G00 Z " + ZOFS.to_s
end

y = 0
dy = STEP * D
x =0

while y < Y
  y = y + dy
  puts "G01 Y " + y.to_s + " F" + SPEED.to_s

  if x==0
    puts "G01 X " + (X-D).to_s + " F"+ SPEED.to_s
    x = X
  else
    puts "G01 X 0 F" + SPEED.to_s
    x = 0
  end

end

# move back to origin
puts "G00 Z " + (1+ZOFS).to_s
puts "G00 X0 Y0"
puts "G00 Z0"