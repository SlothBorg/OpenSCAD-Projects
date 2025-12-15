inch = 25.4;
colors=["gold", "black"];

// changes to 0 to export the text
// change to 1 to export the base
current_color = -1;

include <../utils/colorstl.scad>


// Medal
medal_r = 5 * inch;
medal_h = 4;
medal_sides = 120;
// Text
words = "I have an annoying question that is going to make RCR mad";
text_size = 12;
text_radius = medal_r * 0.85;
// Trophy
trophy_scale = 0.5;
trophy_height = 0.6;

colorpart(1) { 
    difference() {
        // Main medal disc
        cylinder(h = medal_h, r = medal_r, $fn = medal_sides);
    }
}

// Centered trophy
colorpart(0) {
    translate([0, 0, medal_h]) {
        linear_extrude(height = trophy_height) {
            scale([trophy_scale, trophy_scale, 1]) {
                translate([-120, -120, 0]) {
                    import("trophy.svg");
                }
            }
        }
    }
}

// Text
colorpart(0) {
    translate([0, 0, medal_h]) {
        linear_extrude(height = 0.5) {
            arc_text(words, text_radius, text_size);
        }
    }
}

module arc_text(text_string, radius, size) {
    text_length = len(text_string) - 1;
    total_angle = 300;
    angle_step = total_angle / text_length;
    start_angle = total_angle / 2;  // Start from left side of top arc
    
    for (i = [0:text_length]) {
        angle = start_angle - (i * angle_step);
        rotate([0, 0, angle]) {
            translate([0, radius, 0]) {
                text(text_string[i], size=size, font="Nimbus Roman:style=Bold");
            }
        }
    }
}
