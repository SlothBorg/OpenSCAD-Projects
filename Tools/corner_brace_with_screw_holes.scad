inch = 25.4;
$fn = 100;

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
    union() {
        cube([(3 * inch), inch, (inch / 4)]);
        cube([(inch / 4), inch, (3 * inch)]);
    }

    for (i = [1, 2]) {
        translate([(i * inch), (inch / 2), 1.5]) {
            screw_hole();
        }
        
        translate([1.5, (inch / 2), (i * inch)]) {
            rotate([0, 90, 0]) {
                screw_hole();        
            }
        }
    }
}