main_hole_outer_radius = 25;
main_hole_inner_radius = 20;
main_hole_height = 30;

side_holes_outer_radius = 12;
side_holes_inner_radius = 10;
side_holes_height = 60;

screw_hole_depth = 10;

module counterSunkScrewHole() {
    cylinder((screw_hole_depth + 1), 2.1, center = true, $fn = 100);
    translate([0, 0, (screw_hole_depth / -1.2)])
        cylinder(6, 6.2, center = true, $fn = 100);
}

    cylinder(
        main_hole_height,
        side_holes_outer_radius,
        side_holes_outer_radius,
        center = true,
        $fn = 360
    );
    
    rotate([90, 0, 45])
        translate([
            (main_hole_outer_radius - (screw_hole_depth)),
            0,
            0
        ])
            counterSunkScrewHole();
