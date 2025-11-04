inch = 25.4;
colors=["yellow", "black"];

// changes to 0 to export the text
// change to 1 to export the card
current_color = -1;

include <../utils/colorstl.scad>

margin = .25 * inch;
card_size = [
    5 * inch,
    4 * inch,
    //.25 * inch
    3
];


// Hole parameters
hole_radius = 5;
hole_margin = 15;

colorpart(1) {
    difference() {
        cube(card_size);
        translate([card_size[0] - hole_margin, card_size[1] - hole_margin, -1]) {
            cylinder(h=card_size[2] + 2, r=hole_radius, $fn=30);
        }
    }
}

colorpart(0) {
    translate([5, ((4 * inch) - 20), 3]) {
        linear_extrude(height=0.4) {
           text("Drying",size=12);
        }
    }
}

line_spacing = 16;
start_y = (4 * inch) - 38;

data_lines = [
    ["PLA ", "122-131", "4-6h"],
    ["PETG", "140-149", "4-6h"],
    ["TPU ", "122-131", "6-8h"],
    ["ABS ", "140-149", "4-6h"]
];

colorpart(0) {
    for (i = [0:len(data_lines)-1]) {
        // Fillament
        translate([10, start_y - (i * line_spacing), 3]) {
            linear_extrude(height=0.4) {
               text(data_lines[i][0], size=8);
            }
        }
        // Temperature
        translate([47, start_y - (i * line_spacing), 3]) {
            linear_extrude(height=0.4) {
               text(data_lines[i][1], size=8);
            }
        }
        // Time
        translate([100, start_y - (i * line_spacing), 3]) {
            linear_extrude(height=0.4) {
               text(data_lines[i][2], size=8);
            }
        }
    }
}