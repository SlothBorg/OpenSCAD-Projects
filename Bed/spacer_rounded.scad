inch = 25.4;

spacer = [
    3 * inch,
    3 * inch,
    2 * inch,
];

clip_top = [
    spacer[0],
    22.1,
    .25 * inch,
];

clip_side = [
    spacer[0],
    clip_top[2],
    spacer[2],
];

cutout_h = 3 * inch;
cutout_r = 1.5 * inch;
roundness = 64;

r = 3;   // rounding radius
rh = 3;  // rounding height (keep equal to r for a quarter-circle profile)

// Rounds only the top and bottom horizontal edges of a box
// by doing minkowski with a short cylinder
module rounded_box_topbot(size, radius, round_h) {
    minkowski() {
        cube([size[0] - 2*radius, size[1] - 2*radius, size[2] - 2*round_h]);
        cylinder(r = radius, h = round_h * 2, $fn = roundness, center = true);
    }
}

// Main spacer body with cylinder cutouts
translate([r, r, rh])
difference() {
    rounded_box_topbot(spacer, r, rh);
    // Cutouts — extend well beyond top and bottom
    translate([-(cutout_r / 2) - r, cutout_r - r, -10])
        cylinder(h = cutout_h + 20, r = cutout_r, $fn = roundness);
    translate([(cutout_r * 2.5) - r, cutout_r - r, -10])
        cylinder(h = cutout_h + 20, r = cutout_r, $fn = roundness);
}

// Clip top
translate([r, -clip_top[1] + r, (spacer[2] - clip_top[2]) + rh])
    rounded_box_topbot(clip_top, r, rh);

// Clip side
translate([r, -(clip_top[1] + clip_side[1]) + r, (spacer[2] - clip_side[2]) + rh])
    rounded_box_topbot(clip_side, r, rh);
