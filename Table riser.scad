inch = 25.4;

leg = [
    .3 * inch,  // height
    .75 * inch, // bottom R
    .85 * inch, // top R
];
leg_sides = 120;

riser_h = (1.75 * inch);
riser = [
   riser_h + leg[0],   // height
   3 * inch,           // bottom R
   1.75 * inch,        // top R
];
riser_sides = 8;

difference() {
    cylinder(h = riser[0], r1 = riser[1], r2 = riser[2], $fn = riser_sides);
    translate([0, 0, riser_h]) { 
        cylinder(h = leg[0], r1 = leg[1], r2 = leg[2], $fn = leg_sides);
    }

}