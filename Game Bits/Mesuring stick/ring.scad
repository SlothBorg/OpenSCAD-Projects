include <config.scad>

module ring() {
    difference() {
        cylinder(h=(MS_z * .5), r=RING_outer_r, $fn=ROUNDNESS);
        cylinder(h=MS_z, r=RING_inner_r, $fn=ROUNDNESS);
    }
    // Add ridges
    for (i = [0 : CLICK_num-1]) {
        angle = CLICK_base_angle + (i * 90 / (CLICK_num - 1));
        
        rotate([0, 0, angle]) {
            translate([RING_inner_r, 0, 0]) {
                color("red", 1.0)
                cylinder(h=(MS_z * .5), r=CLICK_r, $fn=ROUNDNESS);
            }
        }
    }
}