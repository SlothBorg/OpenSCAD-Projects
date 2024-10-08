inset_x = 125;
inset_y = 125;
inset_z = 4.5;

outer_x = 128;
outer_y = 128;

hole_r = 3.3;
hole_depth = -1.05;
hole_z = 4;
$fn=50;

difference() {
    cube([inset_x, inset_y, inset_z], center = true);

    /* Top left */
    translate([-(outer_x / 4), (outer_y / 4), hole_depth])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Top right */
    translate([(outer_x / 4), (outer_y / 4), hole_depth])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Middle */
    translate([0, 0, hole_depth])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Bottom left */
    translate([-(outer_x / 4), -(outer_y / 4), hole_depth])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Bottom right */
    translate([(outer_x / 4), -(outer_y / 4), hole_depth])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
}


