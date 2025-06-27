include <config.scad>

module peg_bottom() {
    union() {
        cylinder(h=(MS_z * .2), r=RING_outer_r, $fn=ROUNDNESS); 
        cylinder(h=(MS_z * .8), r=PEG_inner_r, $fn=ROUNDNESS); 
    }
}

module peg_top() {
    difference() {
        union() {
            translate([0, 0, (MS_z * .8)]) {
                cylinder(h=(MS_z * .2), r=RING_outer_r, $fn=ROUNDNESS); 
            }
            translate([0, 0, (MS_z * .2)]) {
                cylinder(h=(MS_z * .8), r=PEG_outer_r, $fn=ROUNDNESS);
            }
            // Click peg
            translate([PEG_outer_r, 0, 0]) {
                color("red", 1.0)
                cylinder(h=MS_z, r=CLICK_r, $fn=ROUNDNESS);
            }
            /**
            // Click indicator
            translate([(RING_outer_r / 3), 0, 0]) {
                color("Fuchsia", 1.0) {
                    cylinder(h=INDICATOR_h, r=INDICATOR_r, $fn=INDICATOR_sides);
                }
            }
            **/
        }

        peg_bottom();
    }

}