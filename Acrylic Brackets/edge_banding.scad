wall_thickness = 2;

overhang = 10;
height = 323;

difference() {
    cube([overhang, overhang, height]);
    translate([wall_thickness, wall_thickness, 0]) {
        cube([overhang, overhang, height]);
    }
}