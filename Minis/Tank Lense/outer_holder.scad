glass_h = 10;
glass_r = 40.75;

outer_shell_h = 8;
inner_shell_r = glass_r + 2.1;

outer_shell_r = inner_shell_r + 2;

ring_h = 8;
ring_r = 51.5;

roundness = 64;

difference() {
    cylinder(h = ring_h, r = ring_r, $fn = roundness);
    translate([0, 0, (ring_h / 2)]) {
        cylinder(h = outer_shell_h, r = outer_shell_r, $fn = roundness);
    }
    cylinder(h = glass_h, r = glass_r, $fn = roundness);
}

