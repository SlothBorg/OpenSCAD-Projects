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

difference() {
    cube(spacer);
    translate([-(cutout_r / 2), cutout_r, 0]) {
        cylinder(h = cutout_h, r = cutout_r, $fn = roundness);
    }
        translate([(cutout_r * 2.5), cutout_r, 0]) {
        cylinder(h = cutout_h, r = cutout_r, $fn = roundness);
    }
}

translate([0, -clip_top[1], (spacer[2] - clip_top[2])]) {
    cube(clip_top);
}

translate([0, -(clip_top[1] + clip_side[1]), (spacer[2] - clip_side[2])]) {
    cube(clip_side);
}