glass_h = 10;
glass_r = 40.75;

outer_shell_h = 4;
outer_shell_r = glass_r + 2.1;

inner_opening_h = glass_h;
glass_overhand = 4.6;
inner_opening_r = glass_r - glass_overhand;

roundness = 64;

difference() {
    cylinder(h = outer_shell_h, r = outer_shell_r, $fn = roundness);
    translate([0, 0, 2]) {
        cylinder(h = glass_h, r = glass_r, $fn = roundness);
    }
    cylinder(h = inner_opening_h, r = inner_opening_r, $fn = roundness);
}