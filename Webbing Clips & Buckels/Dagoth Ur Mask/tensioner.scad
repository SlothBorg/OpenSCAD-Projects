width = 20;
height = 12;
length = 3;

difference() {
    cube([width, height, length]);

    translate([2, 2, 0]) {
        cube([(width - 4), (height / 4), length]);
    }

    translate([2, 7, 0]) {
        cube([(width - 4), (height / 4), length]);
    }
}