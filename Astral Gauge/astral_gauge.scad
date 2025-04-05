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
cap_letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"];


module tapered_shell(h, r1, r2, sides) {
    cylinder(h = h, r1 = r1, r2 = r2, $fn = sides);
}

module top_inset(h, r) {
    translate([0, 0, height - h]) {
        cylinder(h = h, r = r, $fn = 120);
    }
}

module symbol_on_facet(i) {
    echo(i);
    echo(cap_letters[i - 1]);
    
    angle = (i - 1) * side_angle;
    midpoint_radius = (bottom_r + top_r) / 2;
    symbol_height_offset = height / 2;
    symbol_depth = 6;
    scale_factor = 0.75;

    rotate([0, 0, (angle + (side_angle / 2))]) {
        translate([midpoint_radius, 0, symbol_height_offset]) {
            rotate([90, 0, 90]) {
                scale([scale_factor, scale_factor, scale_factor]) {
                    linear_extrude(height = symbol_depth, center=true) {
                        text(cap_letters[i - 1], font=font, halign="center", valign="center");
                    }
                }
            }
        }
    }
}


difference() {
    tapered_shell(height, bottom_r, top_r, sides);
    top_inset(inset_h, inset_r);
    
    for (i = [1 : sides]) {
        symbol_on_facet(i);
    }
}
