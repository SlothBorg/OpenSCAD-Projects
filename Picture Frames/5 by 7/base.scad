inch = 25.4;

picture_x = 5 * inch;
picture_y = 7 * inch;
picture_z = 3;

wall_thickness = .2 * inch;

frame_x = picture_x + (wall_thickness * 2);
frame_y = picture_y + (wall_thickness * 2);
frame_z = picture_z + wall_thickness;

difference() {
    cube([frame_x, frame_y, frame_z]);
    translate([wall_thickness, wall_thickness, wall_thickness]) {
        cube([picture_x, picture_y, picture_z]);
    }
}     