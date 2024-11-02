foam_thickness = 50;

bracket_width = 1;
bracket_depth = 20;
bracket_height = foam_thickness;

bottom_support_width = 1;
bottom_support_depth = 20;
// MATH FOR BOTTOM SUPPORT HEIGHT
    bottom_support_a = 5;
    bottom_support_b = 20;
    bottom_support_c = sqrt(pow(bottom_support_a, 2) + pow(bottom_support_b, 2));
    echo(bottom_support_c);
bottom_support_height = bottom_support_c;

// MATH 
bottom_support_angle = 90 - acos(bottom_support_b / bottom_support_c);
echo(bottom_support_height);

// CYLANDER ROUNDNESS
spike_height = 20;
spike_bottom_r = 3;
spike_top_r = .02;

$fn = 100;

// MATH FOR SPIKE PLACEMENT
spike_x_offset = (bracket_height / 4);

screw_height = bracket_width + 2;
screw_r = 2;

difference() {
    hull() {
        cube([bracket_width, bracket_depth, bracket_height]);
        translate([0, 0, (bottom_support_a * -1)]) {
            rotate([0, bottom_support_angle, 0]) {
                cube([bottom_support_width, bottom_support_depth, bottom_support_height]);
            }
        }
        translate([0, 0, (bracket_height + bottom_support_width)]) {
            rotate([0, 90, 0]) {
                cube([bottom_support_width, bottom_support_depth, 10]);
            }
        }    
    }

    translate([bracket_width, 0, 0]) {
        cube([bracket_height, bracket_depth, bracket_height]);
    }
    
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