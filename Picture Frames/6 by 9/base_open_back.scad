inch = 25.4;

picture_x = 6.05 * inch;
picture_y = 9.05 * inch;
picture_z = .95;

wall_thickness = .2 * inch;

frame_x = picture_x + (wall_thickness * 2);
frame_y = picture_y + (wall_thickness * 2);
frame_z = 8;

difference() {
    cube([frame_x, frame_y, frame_z]);
    translate([wall_thickness, wall_thickness, (frame_z - picture_z)]) {
        cube([picture_x, picture_y, picture_z]);
    }
    
    translate([(frame_x *.125), (frame_y * .125), 0]) {
        cube([(frame_x *.75), (frame_y * .75), frame_z]);
    }
}     