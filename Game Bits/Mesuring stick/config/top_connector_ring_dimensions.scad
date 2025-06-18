include <dimensions.scad>

///////////////////////////
// Bottom Connector Ring //
///////////////////////////

outer_ring_h = midpoint_z;
outer_ring_r = (segment_y / 2);

echo(segment_y);
echo(outer_ring_r);


lip_overlap = 1;

cutout_base_h = midpoint_z - lip_overlap;
cutout_base_r = outer_ring_r + lip_overlap;
cutout_top_h = lip_overlap;
cutout_top_r = outer_ring_r;

base_ridge_angle = -225;
ridge_r = 2;
num_ridges = 5;