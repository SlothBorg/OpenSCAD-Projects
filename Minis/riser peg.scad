hole_h = 5.75;
hole_r = 6;

outter_h = 12;
outter_r = hole_r * 2;

roundness = 120;

difference() {
    union() {
        cylinder(h = outter_h, r = outter_r, $fn = roundness);
        translate([0, 0, -hole_h]) {
            cylinder(h = hole_h, r = hole_r, $fn = roundness);
        }
    }
    translate([0, 0, (outter_h - hole_h)]) {
        cylinder(h = hole_h, r = hole_r, $fn = roundness);
    }
}