## Planer

This is the system I finally settled on for getting stock the 
right thickness. The ruby script just generates gcode that cuts
a rectangle. It assumes you start in the lower left with the bit
touching the work piece at the height you want to cut to.

I was having problems with the repeatability of homing my Z axis.
So instead what I do here is a paper test. Using the fixture of
the desired depth, I lower the bit until I can just slide a piece
of paper between it and the fixture with a little bit of scratchiness.
This is pretty repeatable for me.

At that point I can just run this gcode and it flattens the piece out
nicely. The piece is then ready to be cut into a scale.
