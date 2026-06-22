glass_h = 10;
glass_r = 40.75;

outer_shell_h = 8;
inner_shell_r = glass_r + 2.1;

outer_shell_r = inner_shell_r + 2;


roundness = 64;

difference() {
    cylinder(h = outer_shell_h, r = outer_shell_r, $fn = roundness);
    cylinder(h = glass_h, r = inner_shell_r, $fn = roundness);
}