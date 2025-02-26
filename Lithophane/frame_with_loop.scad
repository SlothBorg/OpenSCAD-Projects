inner_x = 150;
inner_y = 200;
inner_z = 6;

wall_thickness = 2;

outer_x = inner_x + (wall_thickness * 2);
outer_y = inner_y + (wall_thickness * 2);
outer_z = inner_z;

loop_r = 12.7;
hole_r = 3;


difference() {
    union() {
        cube([outer_x, outer_y, outer_z]);
        translate([((outer_x / 2)), (inner_y * 1.015), 0]) {
            difference() {
                cylinder(h = inner_z, r = loop_r, $fn = 160);
                translate([0, (loop_r * .5), 0]) {
                    cylinder(h = inner_z, r = hole_r, $fn = 160);
                }
            }
        }        
    }
    
    translate([wall_thickness, wall_thickness, 0]) {
        cube([inner_x, inner_y, inner_z]);
    }
}