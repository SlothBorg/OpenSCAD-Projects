inch = 25.4;

holder_x = 2 * inch;
holder_y =  2 * inch;
holder_z = 4 * inch;

wall_thickness = .3 * inch;

difference() {
    cube([holder_x, holder_y, holder_z]);

    translate([wall_thickness, 0, wall_thickness]) {
        cube([(holder_x - (wall_thickness * 2)), holder_y, holder_z]);
    }
}
