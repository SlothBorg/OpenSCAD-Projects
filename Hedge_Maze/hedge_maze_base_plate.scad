inset_x = 76.2;
inset_y = 76.2;
inset_z = 2.5;

outer_x = 78;
outer_y = 78;
outer_z = 6;

hole_r = 3.5;
hole_z = 4.5;
hole_z = 7;
$fn=50;

edge_inset = 2;

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
    
    translate([hole_x, hole_y, -1.5])
    {
        cylinder(hole_z, inner_r, false);
    }

    translate([neg_hole_x, hole_y, -1.5])
    {
        cylinder(hole_z, inner_r, false);
    }

    translate([hole_x, neg_hole_y, -1.5])
    {
        cylinder(hole_z, inner_r, false);
    }

    translate([neg_hole_x, neg_hole_y, -1.5])
    {
        cylinder(hole_z, inner_r, false);
    }
}
