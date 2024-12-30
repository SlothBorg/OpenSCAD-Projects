inch = 25.4;
$fn = 100;

blade_r = 25.5 / 2;
hilt_r = 30.5 / 2;

cutout_width = 6;
cutout_height = 16;
cutout_depth = 2.5;


screw_shaft = 2;
shaft_length = (2 * inch);
screw_head = 4.5;
head_length = 5;

module screw_hole() {
    union() {
        cylinder(h = head_length, r1 = screw_shaft, r2 = screw_head);
        
        translate([0, 0, -shaft_length]) {
            cylinder(h = shaft_length, r = screw_shaft);
        }
    }    
}


difference() {
    difference() {
        union() {
            difference() {
                cylinder(h = 20, r = 5);
                translate([0, -1, 0]) {
                    cylinder(h = 20, r = 4.5);
                }
            }
        }

        translate([0, 4.75, 5]) {
            rotate([90, 0, 0]) {
                cylinder(h = 5, r = .125);
            }
        }
        
        translate([0, 4.75, 15]) {
            rotate([90, 0, 0]) {
                cylinder(h = 5, r = .125);
            }
        }
        
        translate([0, 10, 0]) {
            screw_hole();
        }
    }

    translate([0, 0, 10]) {
        rotate([90, 0, 0]) {
            screw_hole();
        }
    }
}
