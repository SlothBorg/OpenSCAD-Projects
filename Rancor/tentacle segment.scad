base_r = 10;
top_r = 8.25;
height = 20;
roundness = 120;

rib_radius = 0.6;
num_ribs = 10;
rib_spacing = height / (num_ribs + 1);

$fn = roundness;

module rounded_rib(r, rib_r) {
    rotate_extrude(angle = 360)
        translate([r, 0, 0])
            circle(r = rib_r);
}

bottom_sphere_r = base_r - 2;
top_sphere_r = top_r - 2;


difference() { 
    union() {
        cylinder(height, base_r, top_r);

        for (i = [1 : num_ribs]) {
            rib_height = i * rib_spacing;

            // interpolate radius at this height to match the taper
            taper_fraction = rib_height / height;
            r_at_z = base_r + (top_r - base_r) * taper_fraction;

            translate([0, 0, rib_height])
                rounded_rib(r_at_z, rib_radius);
        }
    }
    sphere(r = (base_r - 2), $fn = roundness);
}