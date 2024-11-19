inch = 25.4;
board_x =  4 * inch;
board_y = 28.28;
board_z = 23.5;

peg_hole_r = 16.25 / 2;
screw_head_r = 8.5 / 2;
screw_head_length = 6.5;
screwn_shaft_r = 5 / 2;
screw_length = 63;

screw_hole_z_offset = 10;

$fn = 100;


module screw(screw_length, screw_head_length, screwn_shaft_r, screw_head_r) {
    union() {
        translate([0, 0, screw_length]) {
            cylinder(screw_head_length, screwn_shaft_r, screw_head_r);
        }
        cylinder(h = screw_length, r = screwn_shaft_r);
    }
} 


difference() {
    cube([board_x, board_y, board_z]);
    
    translate([(board_x / 2), (board_y / 2), 0]) {
        cylinder(h = screw_length, r = peg_hole_r);
    }

    translate([(board_x / 5), (board_y / 2), ((-screw_length - screw_head_length) + board_z)]) {
        screw(screw_length, screw_head_length, screwn_shaft_r, screw_head_r);
    }
    
    translate([(board_x - (board_x / 5)), (board_y / 2), ((-screw_length - screw_head_length) + board_z)]) {
        screw(screw_length, screw_head_length, screwn_shaft_r, screw_head_r);
    }
}