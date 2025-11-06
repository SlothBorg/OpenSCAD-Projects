inch = 25.4;
colors=["yellow", "black"];

// changes to 0 to export the text
// change to 1 to export the card
current_color = -1;

include <../utils/colorstl.scad>

broach_r = 1 * inch;
broach_h = 4;
broach_sides = 8;

hole_r = 2;
hole_h = broach_h * 1.1;

colorpart(1) { 
    difference() {
        cylinder(h = broach_h, r = broach_r, $fn = broach_sides);
        translate([0, (broach_r * .8), -.1]) {
            cylinder(h = hole_h, r = hole_r, $fn = 120);
        }
    }
}

colorpart(0) {
    translate([0, (broach_r * .25), broach_h]) {
        linear_extrude(height=0.4) {
           text("28", size=18, halign="center", valign="center");
        }
    }
    translate([0, (broach_r * -.5), broach_h]) {
        linear_extrude(height=0.4) {
           text("SlothBorg", size=6, halign="center", valign="center");
        }
    } 
}