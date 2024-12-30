width = 20;
height = 6;
length = 2;

difference() {
    cube([width, height, length]);

    translate([2, 2, 0]) {
        cube([(width - 4), (height / 3), length]);
    }
}