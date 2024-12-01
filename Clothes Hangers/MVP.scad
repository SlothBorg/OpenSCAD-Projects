// [x, y, z]

difference() {
    union() {
        cube([5, 10, 20]);
        translate([0, 0, 2]) {
            rotate([0, 45, 0]) {
                cube([5, 10, 20]);
            }
        }
    }

    // cut object
    union() { 
        translate([-5, 0, 0]) {
            cube([5, 10, 20]);
        }
        translate([-5, 0, -3]) {
            cube([10, 10, 3]);
        }
    }
}