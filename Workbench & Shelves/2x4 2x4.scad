// inch = 25.4;
inch = 10;

// x
two_x_four_thickness = 1.5 * inch;
// y
two_x_four_width = 3.5 * inch;

// z
leg_length = 30 * inch;

// x
top_width = 48 * inch;
// y
top_depth = 24 * inch;
// z
top_thickness = 0.75 * inch;

module two_by_four(length) {   
    cube([two_x_four_thickness, two_x_four_width, length]);
}

module leg() {
    color([1, 0, 0]) {
        two_by_four(leg_length);
    }
}


module crossbrace() {
    // short crossbrace
    translate([0, (top_depth - two_x_four_width), 0]) {
        rotate([90, 0, 0]) {
            color([0, .5, 0]) {
                two_by_four(top_depth - (two_x_four_width * 2));
            }
        }
    }

    // long crossbrace
    translate([two_x_four_thickness, (top_depth - two_x_four_thickness), 0]) {
        rotate([90, 0, 0]) {
            color([.5, 0, 0]) {
                two_by_four(top_depth - (two_x_four_thickness * 2));
            }
        }
    }
}

// LEGS
union() {
    // leg 1
    leg();
    // leg 2
    translate([0, (top_depth - two_x_four_width), 0]) {
        leg();
    }
    // leg 3
    translate([(top_width - two_x_four_thickness), (top_depth - two_x_four_width), 0]) {
        leg();
    }
    // leg 4
    translate([(top_width - two_x_four_thickness), 0, 0]) {
        leg();
    }
}

// CROSSBRACES
union() {
// SHEETS
union() {
    // leg 1 & 2 top crossbrace
    translate([0, 0, (leg_length - two_x_four_width)]) {
        crossbrace();
    }

    // leg 1 & 2 bottom crossbrace
    crossbrace();
    // leg 3 & 4 top crossbrace
    translate([top_width, 0, leg_length]) { {
        rotate([0, 180, 0])
            crossbrace();
        }    
    }
    // leg 3 & 4 bottom crossbrace
    translate([top_width, 0, two_x_four_width]) { {
        rotate([0, 180, 0])
            crossbrace();
        }    
    }
    // front bottom crossbrace
    translate([two_x_four_thickness, 0, 0]) {
        rotate([90, 0, 90]) {
            color([0, 1, 0]) {
                two_by_four(top_width - (two_x_four_thickness * 2));
            }
        }
    }
    // back bottom crossbrace
    translate([two_x_four_thickness, (top_depth - two_x_four_thickness), 0]) {
        rotate([90, 0, 90]) {
            color([0, 1, 0]) {
                two_by_four(top_width - (two_x_four_thickness * 2));
            }
        }
    }
    // front top crossbrace
    translate([two_x_four_thickness, 0, (leg_length - two_x_four_width)]) {
        rotate([90, 0, 90]) {
            color([0, 1, 0]) {
                two_by_four(top_width - (two_x_four_thickness * 2));
            }
        }
    }
    // back top crossbrace
    translate([two_x_four_thickness, (top_depth - two_x_four_thickness), (leg_length - two_x_four_width)]) {
        rotate([90, 0, 90]) {
            color([0, 1, 0]) {
                two_by_four(top_width - (two_x_four_thickness * 2));
            }
        }
    }
}

    // top
    translate([0, 0, leg_length]) {
        color([0, 0, 1]) {
            cube([top_width, top_depth, top_thickness]);
        }
    }

    // bottom
    translate([0, 0, two_x_four_width]) {
        color([0, 0, 1]) {
            cube([top_width, top_depth, top_thickness]);
        }
    }
}