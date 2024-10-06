inset_x = 127;
inset_y = 127;
inset_z = 2.5;

outer_x = 130;
outer_y = 130;
outer_z = 8;

hole_r = 2.5;
hole_z = 8;
$fn=50;

edge_inset = 6;



difference() {
    cube([outer_x, outer_y, outer_z], center = true);
    translate([0, 0, 3.5])
    {
        cube([inset_x, inset_y, inset_z], center = true);
    }
    
    /* Top left */
    translate([-(outer_x / 4), (outer_y / 4), 0])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Top right */
    translate([(outer_x / 4), (outer_y / 4), 0])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Middle */
    translate([0, 0, 0])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Bottom left */
    translate([-(outer_x / 4), -(outer_y / 4), 0])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Bottom right */
    translate([(outer_x / 4), -(outer_y / 4), 0])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
}


