inch = 25.4;
sides = 16;

bottom_r = 2 * inch;
top_r = 1.9 * inch;
height = 10;

side_angle = 360 / sides;
side_vertical_angle = atan((height / (bottom_r - top_r)));

inset_r = top_r * .95;
inset_h = 1;

/**
OPTIONS ARE:
    Is Occult
    Is Script
    Hayghin Daedric - no capitilization
**/
font = "Is Occult";

letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"];
//cap_letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"];


module tapered_shell(h, r1, r2, sides) {
    cylinder(h = h, r1 = r1, r2 = r2, $fn = sides);
}

module top_inset(h, r) {
    translate([0, 0, height - h]) {
        cylinder(h = h, r = r, $fn = 120);
    }
}

module symbol_on_facet(i) {  
    angle = (i - 1) * side_angle;
    midpoint_radius = (bottom_r + top_r) / 2;
    symbol_height_offset = height / 2;
    symbol_depth = 6;
    scale_factor = 0.8;

    rotate([0, 0, (angle + (side_angle / 2))]) {
        translate([midpoint_radius, 0, symbol_height_offset]) {
            rotate([90, 0, 90]) {
                scale([scale_factor, scale_factor, scale_factor]) {
                    linear_extrude(height = symbol_depth, center=true) {
                        text(letters[i - 1], font=font, halign="center", valign="center");
                    }
                }
            }
        }
    }
}

module bolt_head() {
    bolt_r = (8 / 2);
    bolt_h = 5;
    
    cylinder(h = bolt_h, r = bolt_r, center = true, $fn = 120);
}
module bolt() {
    bolt_r = (5.2 / 2);
    
    cylinder(h = (height * 3), r = bolt_r, center = true, $fn = 120);
}
difference() {
    tapered_shell(height, bottom_r, top_r, sides);
    top_inset(inset_h, inset_r);
    
    bolt_head();    
    bolt();
    
    for (i = [1 : sides]) {
        symbol_on_facet(i);
    }
}
