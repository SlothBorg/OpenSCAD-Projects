inset_x = 76.2;
inset_y = 76.2;
inset_z = 2.5;

outer_x = 78;
outer_y = 78;
outer_z = 6;

hole_r = 2.5;
hole_z = 5;
$fn=50;

edge_inset = 6;

hole_x = ((outer_x - edge_inset) / 2);
neg_hole_x = (((outer_x - edge_inset) / 2) * -1);
hole_y = ((outer_y - edge_inset) / 2);
neg_hole_y = (((outer_y - edge_inset) / 2) * -1 );

difference() {
    cube([outer_x, outer_y, outer_z], center = true);
    translate([0, 0, 3.5])
    {
        cube([inset_x, inset_y, inset_z], center = true);
    }
    
    /* Top right */
    translate([hole_x, hole_y, -1.5])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Top Mid */
    translate([0, hole_y, -1.5])
    {
        cylinder(outer_x, hole_r, hole_r, false);
    }

    /* Top Left */
    translate([neg_hole_x, hole_y, -1.5])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }

    /* Mid Right */
    translate([hole_x, 0, -1.5])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }   
    
    /* Mid Left */
    translate([neg_hole_x, 0, -1.5])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Bottom Right */
    translate([hole_x, neg_hole_y, -1.5])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
    
    /* Bottom Mid */
    translate([0, neg_hole_y, -1.5])
    {
        cylinder(outer_x, hole_r, hole_r, false);
    }

    /* Bottom Left */
    translate([neg_hole_x, neg_hole_y, -1.5])
    {
        cylinder(hole_z, hole_r, hole_r, false);
    }
}
