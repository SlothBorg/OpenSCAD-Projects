inch = 25.4;

width = 5 * inch;
height = 7 * inch;
depth = .25 * inch;

wall = .1 * inch;

difference() {
    cube([(width + (wall * 2)), (height + (wall * 2)), (depth + wall)]);
    translate([wall, wall, wall]) {
        cube([width, height, depth]);
    }
}    