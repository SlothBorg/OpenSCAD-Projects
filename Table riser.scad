inch = 25.4;
ides = 120;

leg = [
    .3 * inch,  // height
    .75 * inch, // bottom R
    .85 * inch, // top R
];

riser_h = (1.75 * inch);
riser = [
   riser_h + leg[0],   // height
   2 * inch,           // bottom R
   1.75 * inch,        // top R
];

num_holes = 8;
strength_hole = [
    riser_h,
    1,
    1,
];

difference() {
    cylinder(h = riser[0], r1 = riser[1], r2 = riser[2], $fn = ides);
    
    translate([0, 0, riser_h]) { 
        cylinder(h = leg[0], r1 = leg[1], r2 = leg[2], $fn = ides);
    }
        
    cylinder(h = strength_hole[0], r = strength_hole[2], $fn = ides);
    
    angle = 360 / num_holes;
    for (i = [0:num_holes]) {    
        rotate([0, 0, i * angle]) {
            translate([0, (leg[1] - 3), 0]) {
                cylinder(h = strength_hole[0], r = strength_hole[2], $fn = ides);
            }
            if (i % 2 == 0) {
                translate([0, (leg[1] / 2.5), 0]) {
                    cylinder(h = strength_hole[0], r = strength_hole[2], $fn = ides);
                }
            }
        }
    }

}