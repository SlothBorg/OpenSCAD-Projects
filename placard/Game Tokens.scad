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

num_holes = round(placard[1] / 5);
hole_r = .75;
hole_h = placard[2];

difference() {
    union() {
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
            translate([(placard[0] / 2), (placard[1] /2), placard[2]]) {
                linear_extrude(height=0.4) {
                    text(word, size=9, font=font, halign="center", valign="center");      
                }
            }
        }
    }

    for (i = [0:num_holes]) {
        y_offset = placard[1] / num_holes;
        translate([(placard[0] / 2), y_offset * i, 0]) {
            cylinder(h = hole_h + 5, r=hole_r, $fn=30);
        }
    }
}