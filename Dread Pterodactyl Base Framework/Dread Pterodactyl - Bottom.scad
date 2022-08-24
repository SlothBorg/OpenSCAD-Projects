difference() {
    cube([24, 16, 10], false);
    translate([12, 8, 1]) cylinder(12, 4, 4, false);
}

translate([0, -12, 28])
    cube(
        [24, 12, 18],
        false
    );

translate([0, 16, 0])
    cube(
        [24, 55, 12],
        false
    );
    