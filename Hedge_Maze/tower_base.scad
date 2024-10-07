inset_x = 125;
inset_y = 125;
inset_z = 4.5;

outer_x = 128;
outer_y = 128;
outer_z = 5;

hole_r = 3.1;
hole_depth = 2.2;
hole_z = (outer_z / 2) + hole_depth;
$fn=50;

difference() {
    cube([outer_x, outer_y, outer_z], center = true);

    
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


