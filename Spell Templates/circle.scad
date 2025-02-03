template_r = 35;
center_hole_r = 1.25;
height = 1;

number_of_outer_holes = 17;
outer_hole_r = 1.5;

$fn = 200;

difference() {
    cylinder(h = height, r = template_r);
    cylinder(h = height, r = center_hole_r);

    for (i = [0 : number_of_outer_holes]) {        
        rotate(i * (360 / number_of_outer_holes)) {
            translate([template_r, 0, 0]) {
                cylinder(h = height, r = outer_hole_r, $fn = 4);
            }
        }
    }

}