inch = 25.4;

spacer = [3 * inch, 3 * inch, 2 * inch];
clip_top = [spacer[0], 22.1, .25 * inch];
clip_side = [spacer[0], clip_top[2], spacer[2]];

cutout_h = 3 * inch;
cutout_r = 1.5 * inch;
roundness = 64;
r = 3;

// Rounds only the top edge of a box. Bottom stays flat.
// Replaces: cube(size)
module cube_round_top(size, radius) {
    hull() {
        // bottom face — full footprint, razor thin
        cube([size[0], size[1], 0.001]);
        // top face — inset, with rounded corners
        translate([radius, radius, size[2] - radius])
            minkowski() {
                cube([size[0] - 2*radius, size[1] - 2*radius, 0.001]);
                cylinder(r=radius, h=radius, $fn=roundness);
            }
    }
}

// Rounds top AND bottom edges of a box.
// Replaces: cube(size)
module cube_round_top_bottom(size, radius) {
    hull() {
        // bottom inset
        translate([radius, radius, radius])
            minkowski() {
                cube([size[0] - 2*radius, size[1] - 2*radius, 0.001]);
                cylinder(r=radius, h=0.001, $fn=roundness);
            }
        // top inset
        translate([radius, radius, size[2] - radius])
            minkowski() {
                cube([size[0] - 2*radius, size[1] - 2*radius, 0.001]);
                cylinder(r=radius, h=0.001, $fn=roundness);
            }
    }
}

// Main body — round top edge only
difference() {
    cube_round_top(spacer, r);
    translate([-(cutout_r / 2), cutout_r, 0])
        cylinder(h = cutout_h, r = cutout_r, $fn = roundness);
    translate([(cutout_r * 2.5), cutout_r, 0])
        cylinder(h = cutout_h, r = cutout_r, $fn = roundness);
}

// Clip top — round top and bottom edges (same translation as original)
translate([0, -clip_top[1], (spacer[2] - clip_top[2])])
    cube_round_top_bottom(clip_top, 1.5);

// Clip side — round top edge only (same translation as original)
translate([0, -(clip_top[1] + clip_side[1]), (spacer[2] - clip_side[2])])
    cube_round_top(clip_side, r);

