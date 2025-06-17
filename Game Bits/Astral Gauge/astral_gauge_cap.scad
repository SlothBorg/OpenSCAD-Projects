inch = 25.4;
$fn = 120;

height = 5;
washer_r = (12.8 / 2);
washer_h = 0.5;

module basic_shape() {
    difference() {
        union() {
            cylinder(h = height, r = (washer_r * 1.2));
            translate([0, 0, height]) {
                sphere((washer_r * 1.2));
            }
        }
        translate([0, 0, -height]) {
            cylinder(h = height, r = (washer_r * 1.2));
        }
    }
}
module washer() {
    cylinder(h = washer_h, r = washer_r);
}
module nut() {
    sides = 6;
    nut_r = (11.4 / 2);
    nut_h = 6.25;
    
    cylinder(h = nut_h, r = nut_r, $fn = sides);
}

difference() {
    basic_shape();
    washer();
    translate([0, 0, washer_h]) {
        nut();
    }
}