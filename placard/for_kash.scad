line_1 = "Be strong and courageous. Do not be afraid;";
line_2 = "do not be discouraged, for the Lord your God";
line_3 = "will be with you wherever you go. Joshua 1:9";
inch = 25.4;
colors=["yellow", "black"];
// changes to 0 to export the text
// change to 1 to export the card
current_color = -1;
include <../utils/colorstl.scad>
placard = [
    3.5 * inch,
    1 * inch,
    .25 * inch
];

// Calculate equal spacing
num_lines = 3;
text_height = placard[1];
spacing = text_height / (num_lines + 1);

colorpart(1) { 
    cube(placard);
}
colorpart(0) { 
    // Line 1 - top
    translate([(placard[0] / 2), (placard[1] - spacing), placard[2]]) {
        linear_extrude(height=0.4) {
            text(line_1, size=3, halign="center", valign="center");      
        }
    }
    // Line 2 - middle
    translate([(placard[0] / 2), (placard[1] - 2 * spacing), placard[2]]) {
        linear_extrude(height=0.4) {
            text(line_2, size=3, halign="center", valign="center");      
        }
    }
    // Line 3 - bottom
    translate([(placard[0] / 2), (placard[1] - 3 * spacing), placard[2]]) {
        linear_extrude(height=0.4) {
            text(line_3, size=3, halign="center", valign="center");      
        }
    }
}