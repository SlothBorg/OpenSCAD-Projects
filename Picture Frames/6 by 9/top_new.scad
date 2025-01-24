inch = 25.4;

picture_x = 6.05 * inch;
picture_y = 9.05 * inch;
picture_z = .95;

wall_thickness = .2 * inch;

frame_x = picture_x + (wall_thickness * 2);
frame_y = picture_y + (wall_thickness * 2);
frame_z = 8;

overhang = (1/8 * inch);

echo(overhang);

outside_x = frame_x + (overhang * 2);
outside_y = frame_y + (overhang * 2);
outside_z = frame_z + overhang;

picture_inset = overhang + wall_thickness;

difference() {
    cube([outside_x, outside_y, outside_z]);
    
    translate([overhang, overhang, 0]) {
        cube([frame_x, frame_y, frame_z]);
    }
    
    translate([picture_inset, picture_inset, frame_z]) {
        color([0, 0, 1])
        cube([(picture_x - overhang), (picture_y - overhang), frame_z]);
    }
}
