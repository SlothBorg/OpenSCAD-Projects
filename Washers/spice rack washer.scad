inner_radius = 2;
outer_radius = 6;
height = 3;

difference() {
    cylinder($fn = 60, h = height, r1 = outer_radius, r2 = outer_radius, center = false);
    translate([0, 0, -2])
        cylinder($fn = 60, h = (height*2), r1 = inner_radius, r2 = inner_radius, center = false);
}