D = 6         # diameter of bit
X = 145
Y = 40
STEP = 0.4
SPEED = 600

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

puts "G90"
puts "G10 L20 P0 X0 Y0 Z0"

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
puts "G00 Z1"
puts "G00 X0 Y0"
puts "G00 Z0"