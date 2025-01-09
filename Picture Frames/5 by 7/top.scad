inch = 25.4;

picture_x = 5.05 * inch;
picture_y = 7.05 * inch;
picture_z = 3;

wall_thickness = .2 * inch;

frame_x = picture_x + (wall_thickness * 2);
frame_y = picture_y + (wall_thickness * 2);
frame_z = picture_z + wall_thickness;

overhang = (1/8 * inch);

echo(overhang);


outside_x = frame_x + (overhang * 2);
outside_y = frame_y + (overhang * 2);
outside_z = frame_z + overhang;

picture_inset = overhang + wall_thickness;

difference() {
    cube([outside_x, outside_y, outside_z]);
    
    translate([picture_inset, picture_inset, 0]) {
        cube([picture_x, picture_y, picture_z + 10]);
    }
    
    translate([overhang, overhang, overhang]) {
        cube([frame_x, frame_y, frame_y + 10]);
    }
}

difference() {
    translate([picture_inset, picture_inset, 0]) {
        cube([picture_x, picture_y, (overhang - picture_z)]);
    }

    translate([picture_inset + overhang, picture_inset + overhang, 0]) {
        cube([picture_x - (overhang * 2), picture_y - (overhang * 2), 8]);
    }
}