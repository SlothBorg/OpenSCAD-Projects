bottom_r = 6.6;
bottom_height = 4;

top_r = 8;
top_height = 4;

inner_inset_r = 4.95;
inner_inset_height = 5;

$fn=80;


cylinder(bottom_height, bottom_r, bottom_r, false);
translate([0, 0, bottom_height])
{
    cylinder(top_height, top_r, top_r, false);
}
translate([0, 0, (bottom_height + top_height)])
{
    cylinder(inner_inset_height, inner_inset_r, inner_inset_r, false);
}



