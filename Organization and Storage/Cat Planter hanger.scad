cleat_x = 55;
cleat_y = 17;
cleat_z = 14;

hook_x = 55;
hook_y = 11;
hook_z = 7;


screw_head_r = 8.5 / 2;
screw_head_length = 6.5;
screwn_shaft_r = 5 / 2;
screw_length = 63;

$fn = 100;

module screw(screw_length, screw_head_length, screwn_shaft_r, screw_head_r) {
    union() {
        cylinder(screw_head_length, screw_head_r, screwn_shaft_r);
        translate([0, 0, screw_head_length]) {
            cylinder(h = screw_length, r = screwn_shaft_r);
        }
    }
} 

difference() {
    union() {
        cube([cleat_x, cleat_y, cleat_z]);
        translate([0, cleat_y, 0]) {
            cube([hook_x, hook_y, hook_z]);
        }
    }


    translate([10, 10, 0]) {
        screw(screw_length, screw_head_length, screwn_shaft_r, screw_head_r);
    }

    translate([(cleat_x - 10), 10, 0]) {
        screw(screw_length, screw_head_length, screwn_shaft_r, screw_head_r);
    }
}