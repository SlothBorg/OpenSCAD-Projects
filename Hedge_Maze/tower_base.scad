inset_x = 125;
inset_y = 125;
inset_z = 4.5;

outer_x = 128;
outer_y = 128;
outer_z = 5;

inset_depth = 3;

hole_r = 3.3;
hole_depth = 3;
hole_z = 4;
$fn=50;

difference() {
    cube([outer_x, outer_y, outer_z], center = true);

    translate([0, 0, inset_depth])
    {
        cube([inset_x, inset_y, inset_z], center = true);
    }

    
    /* Top left */
    translate([-(outer_x / 4), (outer_y / 4), -1])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Top right */
    translate([(outer_x / 4), (outer_y / 4), -1])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Middle */
    translate([0, 0, -1])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Bottom left */
    translate([-(outer_x / 4), -(outer_y / 4), -1])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Bottom right */
    translate([(outer_x / 4), -(outer_y / 4), -1])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
}


