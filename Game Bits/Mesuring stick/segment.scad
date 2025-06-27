include <config.scad>
include <ring.scad>
include <peg.scad>

module cutouts() {
    for (x_pos = [0, MS_x]) {
        translate([x_pos, MS_mid_y, 0]) {
                cylinder(h=MS_z, r=MS_mid_y, $fn=ROUNDNESS);
        }
    }
}

module click_indicators() {
    for (i = [0 : INDICATOR_num - 1]) {
        angle = INDICATOR_base_angle + (i * 90 / (INDICATOR_num - 1));
        
        rotate([0, 0, angle]) {
            translate([RING_inner_r, 0, 0]) {
                color("red", 1.0)
                cylinder(h=INDICATOR_h, r=1, $fn=ROUNDNESS);
            }
        }
    }
}

module segment() {
    difference() {
        cube([MS_x, MS_y, MS_z]);
        cutouts();
    }
    /**
    translate([(MS_mid_y / 2), MS_mid_y, 0]) {
        rotate(180) {
            click_indicators();
        }
    }
    **/
}

segment();

translate([0, MS_mid_y, (MS_z * .25)]) {
    ring();
}

translate([MS_x, MS_mid_y, 0]) {
    peg_top();
}