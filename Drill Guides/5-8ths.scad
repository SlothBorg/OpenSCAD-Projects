hole_r = (16 / 2);
shaft_r = (7 / 2);
//bit_head_length = 16;
bit_head_length = 60;

board_thickness = 28.55;
inch = 25.4;

guide_x = 60;
guide_y = board_thickness + inch;
guide_z = inch * 2;

cutout_x = guide_x * 2;
cutout_y = board_thickness;
cutout_z = inch;

$fn = 100;

difference() {
    cube([guide_x, guide_y, guide_z]);
    union() {
        translate([(guide_x / 2), (guide_y / 2), (inch - 0.01)]) {
            cylinder(h = bit_head_length, r = hole_r);
            translate([0, 0, bit_head_length]) {
                cylinder(h = (inch * 2), r = shaft_r);
            }
        }
        translate([0, (guide_y / 2), (inch / 2)]) {
            cube([cutout_x, cutout_y, cutout_z], center=true);
        }
    }
}