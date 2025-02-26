inner_x = 150;
inner_y = 200;
inner_z = 6;

wall_thickness = 2;

outer_x = inner_x + (wall_thickness * 2);
outer_y = inner_y + (wall_thickness * 2);
outer_z = inner_z;

difference() {
    cube([outer_x, outer_y, outer_z]);
    translate([wall_thickness, wall_thickness, 0]) {
        cube([inner_x, inner_y, inner_z]);
    }
}