D = 6         # diameter of bit
X = 160       # width of rectangle (x axis) 141
Y = 70        # ht of rectangle (y axis) 44
STEP = 0.35   # percent overlap of cuts
SPEED = 600  # speed in mm/s
              # wood can take 1200 with the 6mm bit @ 6500rpm
              # so can micarta
ZOFS = 0      # if positive, move up this amt before cutting
HOMEZ = 0     # home z axis?


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

puts "; dimensions " + X.to_s + "x" + Y.to_s + ", height " + ZOFS.to_s
puts "; speed = " + SPEED.to_s
puts "; bit diameter = " + D.to_s

puts "; set position at start to home"
puts "G90"
puts "G10 L20 P0 X0 Y0 Z0"

if (HOMEZ>0)
  puts "; z homing, bit should be less than 2cm above spoilboard"
  puts "M0 (MSG Place Z Probe)"

  # obviously this is specific to my probe height
  puts "G38.2 G91 Z-20 F50 P1.6"
  puts "G1 Z2 F150"

  # obviously this is specific to my probe height
  puts "G38.2 G91 Z-5 F30 P1.6"
  puts "G1 Z3 F150"

  puts "G90"
  puts "M00 (MSG Remove Z Probe and turn on spindle)"
  puts "G00 Z0"
end

puts "; commence planing! this is not an Anathem reference"

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