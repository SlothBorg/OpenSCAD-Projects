inch = 25.4;

rounding_r = 2; 
roundness = 64; 

overlap = 5.0; 

spacer = [
    3 * inch,
    3 * inch,
    2 * inch
];

clip_top_orig_y = 22.1;
clip_top = [
    spacer[0],
    clip_top_orig_y,
    .25 * inch
];

clip_side = [
    spacer[0],
    clip_top[2],
    spacer[2]
];

cutout_h = 3 * inch;
cutout_r = 1.5 * inch;

module rounded_box(size, r) {
    hull() {
        for (x = [r, size.x - r]) {
            for (y = [r, size.y - r]) {
                for (z = [r, size.z - r]) {
                    // Place spheres at the corners to define the hull
                    translate([x, y, z]) {
                        sphere(r = r, $fn = roundness);
                    }
                }
            }
        }
    }
}

// Combine all parts into a single solid object
union() {
    difference() {
        rounded_box(spacer, rounding_r);
        
        translate([-(cutout_r / 2), cutout_r, -1]) {
            cylinder(h = cutout_h + 2, r = cutout_r, $fn = roundness);
        }
            
        translate([(cutout_r * 2.5), cutout_r, -1]) {
            cylinder(h = cutout_h + 2, r = cutout_r, $fn = roundness);
        }
    }

    // Top bridge piece
    // Translated and sized to maintain the 22.1mm gap while sinking into adjacent parts
    translate([0, -clip_top_orig_y - overlap, (spacer[2] - clip_top[2])]) {
        rounded_box([clip_top[0], clip_top_orig_y + (2 * overlap), clip_top[2]], rounding_r);
    }

    // Side wall piece
    // Positioned so the inner face remains exactly at the 22.1mm mark
    translate([0, -(clip_top_orig_y + clip_side[1]), (spacer[2] - clip_side[2])]) {
        rounded_box([clip_side[0], clip_side[1], clip_side[2]], rounding_r);
    }
}