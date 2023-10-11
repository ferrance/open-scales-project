# Zero Tolerance 0640

## Original Knife

todo insert stock image

(BHQ Link)[https://www.bladehq.com/item--Zero-Tolerance-Emerson-0640-Folding--92047]

The 0640 uses 2mm thick green carbon fiber scales (there was a limited edition in black). The lock
side has two cutouts on the back; the non-lock side is simple and has no cutouts. 

## The scales

Given the simplicity of this scale, I've chosen to render it as an SVG. 

For either side, I start with a 1.5x6" piece that is about 1/8" thick, then
sand it down to a 2mm thickness.

### The non-locking side

![Front of stock scale](/zt-0640/images/zt640-front.jpg)

The non-locking side requires only a few holes and a bevel. This can 
be machined with two tools. I have used a 2mm end mill for everything except
the final bevel. The final bevel uses a 120 degree chamfer mill.

The pivot and the two screws that hold the knife together have 1mm counterbores.

ESTLcam does the bevel after it cuts out the part, so you need to make sure
that the piece is adhered to the spoilboard.

### The locking side

![Back of lock-side scale](/zt-0640/images/zt640-lockside-back.jpg)

This is the more difficult of the two scales. Since there is milling
on both sides, there are two holes on either side that are used to 
position the piece. These are sized for 1/8" brass rod that I use. 
The gcode uses the center of the left of these two holes as its origin.

The first pass mills the back side of the scale and mills the to holes
used for positioning. This is quick and easy. Position the tool over
where the left hole should be and run the gcode. I use a 2mm mill here.

Before the second pass, you will need to flip the piece over and align
using the holes and brass rod. But before you do that, apply some adhesive.
Like the non-lock-side scale, this operation will cut the part out before it 
applies the bevel.

Once the piece is positioned and the glue has adequately set, start this
operation with a 2mm mill. There is a tool change at the end for the 120
degree bevel.