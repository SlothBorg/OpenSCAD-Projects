inch = 25.4;

// x
beam_thickness = .75 * inch;
// y
beam_width = 2.5 * inch;

// x
top_width = 36 * inch;
// y
top_depth = 12 * inch;
// z
top_thickness = 0.5 * inch;

module one_by_two(length) {   
    cube([beam_thickness, length, beam_width]);
}

// x
two_x_four_thickness = 1.5 * inch;
// y
two_x_four_width = 3.5 * inch;

module two_by_four(length) {   
    cube([two_x_four_width, two_x_four_thickness, length]);
}


// for ease of use:
verticals = top_depth - (beam_thickness * 2);

echo( verticals );

vartical_placements = [0, 12, 24, 36];

for (i = vartical_placements) { 
    if (i > 0) {
        location = (i * inch) - beam_thickness;
        translate([location, beam_thickness, 0]) {
            color([.5, 0, .25]) {
                one_by_two(verticals);
            }
        }
    } else {
        translate([0, beam_thickness, 0]) {
            color([.5, 0, .25]) {
                one_by_two(verticals);
            }
        }
    }
}

cube([top_width, beam_thickness, beam_width]);

translate([0, (top_depth - beam_thickness), 0]) {
    cube([top_width, beam_thickness, beam_width]);
}

two_by_four_placements = [0, 16];

for (i = two_by_four_placements) { 
    translate([((i + 8) * inch), top_depth, -(5 * inch)]) {
        color([0, 0, 0]) {
            two_by_four(10 * inch);
        }
    }
}

screw_holes = [2, 10, 14, 22, 26, 34];

for (i = screw_holes) {
    translate([(i * inch), (top_depth + (2.5 * inch)), (beam_width / 4)]) {
        rotate([90, 0, 0]) {
            color([1, 1, 1]) {
                cylinder(h = (4 * inch), r = (.25 * inch), $fn = 100);
            }
        }
    }
    translate([(i * inch), (top_depth + (2.5 * inch)), (beam_width * .75)]) {
        rotate([90, 0, 0]) {
            color([1, 1, 1]) {
                cylinder(h = (4 * inch), r = (.25 * inch), $fn = 100);
            }
        }
    }
}