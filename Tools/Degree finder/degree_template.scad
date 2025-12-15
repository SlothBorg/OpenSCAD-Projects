degrees = 60;
arm_length = 100;
arm_width = 20;
thickness = 3;

translate([0, -arm_width/2, 0]) {
    cube([arm_length, arm_width, thickness]);
}

rotate([0, 0, degrees]) {
    translate([0, -arm_width/2, 0]) {
        cube([arm_length, arm_width, thickness]);
    }
}
