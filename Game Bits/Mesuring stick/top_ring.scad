include <config/top_connector_ring_dimensions.scad>

module top_ring() {
    union() {
        cylinder(h=segment_z, r=(outer_ring_r / tolerance_factor), $fn=default_roundness);

        translate([0, 0, outer_ring_h]) {
            cylinder(h=outer_ring_h, r=(midpoint_y * tolerance_factor), $fn=default_roundness);

            // Add ridges
            for (i = [0 : num_ridges-1]) {
                // Center the ridges around 0° (x-axis)
                angle = base_ridge_angle + (i * 90 / (num_ridges - 1));
                
                rotate([0, 0, angle]) {
                    translate([outer_ring_r, 0, 0]) {
                        cylinder(h=(outer_ring_h * tolerance_factor), r=(ridge_r / 2), $fn=indicator_sides);
                    }
                }
            }
        }

        // add click peg
        rotate([0, 0, -180]) {
            translate([(outer_ring_r / tolerance_factor), 0, 0]) {
                cylinder(h=segment_z, r=ridge_r, $fn=default_roundness);
            }
        }

        // add side stops
        for (angle = [95, 275]) {
            rotate([0, 0, angle]) {
                translate([(outer_ring_r / tolerance_factor), 0, 0]) {
                    cube([ridge_r, ridge_r, (outer_ring_h * .75)]);
                }
            }
        }
    }
}