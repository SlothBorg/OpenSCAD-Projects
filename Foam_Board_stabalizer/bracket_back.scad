foam_thickness = 50;

bracket_width = 1;
bracket_depth = 20;
bracket_height = foam_thickness;

screw_height = bracket_width + 2;
screw_r = 2;

spike_height = 20;
spike_bottom_r = 3;
spike_top_r = .02;

$fn = 100;

// MATH FOR HOLE
spike_x_offset = (bracket_height / 4);

difference() {
    cube([bracket_width, bracket_depth, bracket_height]);
    translate([0, (bracket_depth / 2), spike_x_offset]) {
        rotate([0, 90, 0]) {
            cylinder(h=screw_height, r=screw_r);
        }
    }

    translate([0, (bracket_depth / 2), (bracket_height - spike_x_offset)]) {
        rotate([0, 90, 0]) {
            cylinder(h=screw_height, r=screw_r);
        }
    }
}

translate([0, (bracket_depth / 2), (bracket_height / 2)]) {
    rotate([0, 90, 0]) {
        cylinder(spike_height, spike_bottom_r, spike_top_r);
    }
}