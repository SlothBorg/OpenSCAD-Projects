foam_thickness = 50;
bracket_width = 2;
bracket_depth = 20;
bracket_height = foam_thickness;
bottom_support_width = 1;
bottom_support_depth = 20;

// MATH FOR BOTTOM SUPPORT HEIGHT
bottom_support_a = 10;
bottom_support_b = 30;
bottom_support_c = sqrt(pow(bottom_support_a, 2) + pow(bottom_support_b, 2));
bottom_support_height = bottom_support_c;

// MATH FOR BOTTOM SUPPORT ANGLE
bottom_support_angle = 90 - acos(bottom_support_b / bottom_support_c);


// ROUNDNESS
$fn = 100;

// CYLANDER ROUNDNESS
spike_height = 20;
spike_bottom_r = 3;
spike_top_r = .02;

// MATH FOR SPIKE PLACEMENT
spike_x_offset = (bracket_height / 4);

screw_shaft_r = 2;
screw_head_r = 4;

/** OBJECT **/

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
                cube([bottom_support_width, bottom_support_depth, 20]);
            }
        }    
    }

    translate([bracket_width, 0, 0]) {
        cube([(bracket_height * 5), bracket_depth, bracket_height]);
    }
    
    // SCREW HOLE TOP
    translate([0, (bracket_depth / 2), (bracket_height - spike_x_offset)]) {
        rotate([0, 90, 0]) {
            cylinder(h=bracket_width, r=screw_shaft_r);
        }
    }
    translate([(bracket_width / 2), (bracket_depth / 2), (bracket_height - spike_x_offset)]) {
        rotate([0, 90, 0]) {
            cylinder(h=bracket_width, r=screw_head_r);
        }
    }
    
    // SCREW HOLE BOTTOM
    translate([0, (bracket_depth / 2), spike_x_offset]) {
        rotate([0, 90, 0]) {
            cylinder(h=bracket_width, r=screw_shaft_r);
        }
    }
    translate([(bracket_width / 2), (bracket_depth / 2), spike_x_offset]) {
        rotate([0, 90, 0]) {
            cylinder(h=bracket_width, r=screw_head_r);
        }
    }
}

// SPIKES
translate([bracket_width, (bracket_depth / 2), (bracket_height / 2)]) {
    rotate([0, 90, 0]) {
        cylinder(spike_height, spike_bottom_r, spike_top_r);
    }
}
translate([0, (bracket_depth / 2), (bracket_height / 2)]) {
    rotate([0, -90, 0]) {
        cylinder(spike_height, spike_bottom_r, spike_top_r);
    }
}