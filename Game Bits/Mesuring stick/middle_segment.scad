include <config/dimensions.scad>
include <bottom_ring.scad>
include <top_ring.scad>

difference() {
    union() {
        cube([segment_x, segment_y, segment_z]);

        // Right peg indicator
        translate([indicator_x, indicator_y, 0]) {
            cylinder(h = indicator_h, r = indicator_r, $fn=indicator_sides);
        }
        
        // Right bottom connector ring
        translate([segment_x, midpoint_y, 0]) {
            cylinder(h=midpoint_z, r=(midpoint_y * tolerance_factor), $fn=default_roundness);
        }
    }
    // Right bottom connector bits
    translate([0, midpoint_y, 0]) {
        cylinder(h=segment_z, r=(midpoint_y * tolerance_factor), $fn=default_roundness);
    }
    
    // Right bottom connector bits
    translate([segment_x, midpoint_y, midpoint_z]) {
        cylinder(h=midpoint_z, r=(midpoint_y * tolerance_factor), $fn=default_roundness);
    }
    
    // Right bottom ring cutout shape
    translate([segment_x, midpoint_y, 0]) {
        ring_cutout_shape();
    }
}

// Right bottom ring cutout shape
translate([0, midpoint_y, 0]) {
    top_ring();
}