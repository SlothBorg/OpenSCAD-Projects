include <config/bottom_connector_ring_dimensions.scad>

module ring_cutout_shape() {
    difference() {
        union() {
            cylinder(h=cutout_base_h, r=cutout_base_r, $fn=default_roundness);
            translate([0, 0, cutout_base_h]) {
                cylinder(h=cutout_top_h, r=cutout_top_r, $fn=default_roundness);
            }
            // Add ridges
            for (i = [0 : num_ridges-1]) {
                // Center the ridges around 0° (x-axis)
                angle = base_ridge_angle + (i * 90 / (num_ridges - 1));
                
                rotate([0, 0, angle]) {
                    translate([cutout_base_r, 0, 0]) {
                        cylinder(h=cutout_base_h, r=ridge_r, $fn=default_roundness);
                    }
                }
            }
        }
        // Add cutout
        translate([cutout_base_r, 0, 0]) {
            cylinder(h=outer_ring_h, r=ridge_r, $fn=default_roundness);
        }
    }
}