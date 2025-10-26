ROUNDNESS = 60;
TOLERANCE = .5;

can_r = 13;
can_h = 14;

wall_thickness = 1;

dispenser_x = (can_r + wall_thickness + TOLERANCE) * 2;
dispenser_y = can_r;
dispenser_z = (can_h + wall_thickness + TOLERANCE) * 12;

difference() {
    hull() {
        translate([-(dispenser_x / 2), wall_thickness, 0]) {
            cube([dispenser_x, dispenser_y, dispenser_z]);
        }
        cylinder(h = dispenser_z, r = (can_r + wall_thickness + TOLERANCE), $fn=ROUNDNESS);
    }
    cylinder(h = dispenser_z, r = (can_r + TOLERANCE), $fn=ROUNDNESS);
}
