inch = 25.4;

small_cube = [
    1 * inch,
    1 * inch,
    1 * inch,
];

space = 1.5;

rows = 6;
cols = 6;

plate_x = ((inch + space) * rows) + space;
plate_y = ((inch + space) * cols) + space;


difference() {
    union() {
        translate([-space, -space, -space]) {
            cube([
                ((inch + space) * rows) + space,
                ((inch + space) * cols) + space,
                space * 2,
            ]);
        }
        
        translate([-space, -space, -space]) {
            linear_extrude(height = inch) {
                difference() {
                    square([plate_x, plate_y]);
                    offset(-space)
                        square([plate_x, plate_y]);
                }
            }
        }
    }
    for (i = [0 : (rows - 1)]) {
        for (j = [0 : (cols - 1)]) {
            x_offset = (small_cube[0] + space) * i;
            y_offset = (small_cube[1] + space) * j;
            translate([x_offset, y_offset, 0]) {
                cube(small_cube);
            }
        }
    }
}