base_r = 23;
margin = 2;
top_r = base_r - margin;

height = 10;
roundness = 90;

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
        translate([0, 0, height + (top_sphere_r / 3)]) {
            sphere(r = top_sphere_r);
        }
    
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
    /**
    translate([0, 0, -(bottom_sphere_r / 5)]) {
        sphere(r = bottom_sphere_r);
    }
    **/
    translate([-base_r, -base_r, -(base_r * 2)]) {
        cube(base_r * 2);
    }
    
}