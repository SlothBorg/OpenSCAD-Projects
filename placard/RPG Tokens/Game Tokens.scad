word = "XP";
font = "BilboDisplay";

inch = 25.4;
colors=["red", "black"];
// changes to 0 to export the text
// change to 1 to export the card
current_color = 0;
include <../utils/colorstl.scad>
include <Round-Anything/polyround.scad>
placard = [
    50,
    33,
    1.25
];
corner_radius = 3;
border_inset = 1;
border_height = 0.4;

num_holes = round(placard[1] / 5);
hole_r = 1.25;
hole_h = placard[2];

difference() {
    union() {
        // Token
        colorpart(1) {
            linear_extrude(height = placard[2]) {
                polygon(
                    polyRound([
                        [0, 0, corner_radius],
                        [placard[0], 0, corner_radius],
                        [placard[0], placard[1], corner_radius],
                        [0, placard[1], corner_radius]
                    ])
                );
            }
        }
        colorpart(0) { 
            // Border
            translate([0, 0, placard[2]]) {
                linear_extrude(height = border_height) {
                    difference() {
                        polygon(
                            polyRound([
                                [border_inset, border_inset, corner_radius],
                                [placard[0] - border_inset, border_inset, corner_radius],
                                [placard[0] - border_inset, placard[1] - border_inset, corner_radius],
                                [border_inset, placard[1] - border_inset, corner_radius]
                            ])
                        );
                        polygon(
                            polyRound([
                                [border_inset * 2, border_inset * 2, corner_radius],
                                [placard[0] - border_inset * 2, border_inset * 2, corner_radius],
                                [placard[0] - border_inset * 2, placard[1] - border_inset * 2, corner_radius],
                                [border_inset * 2, placard[1] - border_inset * 2, corner_radius]
                            ])
                        );
                    }
                }
            }
            // Word
            translate([(placard[0] / 2), (placard[1] /2), placard[2]]) {
                linear_extrude(height=0.4) {
                    text(word, size=9, font=font, halign="center", valign="center");      
                }
            }
        }
    }

    // Perferation
    for (i = [0:num_holes]) {
        y_offset = placard[1] / num_holes;
        translate([(placard[0] / 2), y_offset * i, 0]) {
            if (i == 0 || i == 7) {
                cylinder(h = hole_h + 5, r=(hole_r * 1.5), $fn=30);
            } else {
                cylinder(h = hole_h + 5, r=hole_r, $fn=30);
            }
        }
    }
}