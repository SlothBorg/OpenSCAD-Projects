height = rands(29.23, 40.51, 1)[0];
head = rands(4.44, 6.09, 1)[0];
shoulder = rands(10.81, 15, 1)[0];
shoulder_height = (height - rands(3.95, 7.25, 1)[0]);
shoulder_width = rands(1.25, 2.29, 1)[0];
upper_arm_length = rands(7.86, 10.81, 1)[0];
arm_width = rands(1.19, 2.085, 1)[0];
forearm_length_ratio = rands(0.757, 0.882, 1)[0];

upper_arm_angle = 145;
forearm_angle = 145;

// Calculate upper arm endpoints
left_arm_end_x  = -(shoulder / 2) + upper_arm_length * sin(-forearm_angle);
left_arm_end_z  = shoulder_height + upper_arm_length * cos(-forearm_angle);

right_arm_end_x = (shoulder / 2) + upper_arm_length * sin(forearm_angle);
right_arm_end_z = shoulder_height + upper_arm_length * cos(forearm_angle);

roundness = 24;

/////////////////////////////////////////////    
    
// Head
translate([0, 0, height]) {
    sphere(3, $fn = roundness);
}

// Body
cylinder(h = height, r = 2, $fn = roundness);

// Shoulders
translate([-(shoulder / 2), 0, shoulder_height]) {
    rotate([0, 90, 0]) {
        cylinder(h = shoulder, r = shoulder_width, $fn = roundness);
    }
}

// Upper arm left
translate([-(shoulder / 2), 0, shoulder_height]) {
    rotate([0, -upper_arm_angle, 0]) {
        cylinder(h = upper_arm_length, r = arm_width, $fn = roundness);
    }
}
// Upper arm right
translate([(shoulder / 2), 0, shoulder_height]) {
    rotate([0, 145, 0]) {
        cylinder(h = upper_arm_length, r = arm_width, $fn = roundness);
    }
}

// Forearm left
translate([left_arm_end_x, 0, left_arm_end_z]) {
    rotate([0, -185, 0]) {
        cylinder(h = (upper_arm_length * forearm_length_ratio), r = arm_width, $fn = roundness);
    }
}

// Forearm right
translate([right_arm_end_x, 0, right_arm_end_z]) {
    rotate([0, 185, 0]) {
        cylinder(h = (upper_arm_length * forearm_length_ratio), r = arm_width, $fn = roundness);
    }
}


translate([40, 0, 0]) {
    cylinder(h = upper_arm_length, r = arm_width, $fn = roundness);
}
translate([50, 0, 0]) {
    cylinder(h = (upper_arm_length * forearm_length_ratio), r = arm_width, $fn = roundness);
}