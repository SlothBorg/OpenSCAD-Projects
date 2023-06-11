main_hole_outer_Radius = 25;
main_hole_inner_radius = 20;
main_hole_height = 30;


side_holes_outer_Radius = 12;
side_holes_inner_radius = 10;
side_holes_height = 60;



difference() {
    $fn = 360;
    cylinder(
        main_hole_height,
        main_hole_outer_Radius,
        main_hole_outer_Radius,
        center = true
    );
    cylinder(
        (main_hole_height + 2),
        main_hole_inner_radius,
        main_hole_inner_radius,
        center = true
    );
}

rotate ([90,0,0])
    difference() {
        $fn = 360;
        cylinder(
            side_holes_height,
            side_holes_outer_Radius,
            side_holes_outer_Radius,
            center = true
        );
        cylinder(
            (side_holes_height + 2),
            side_holes_inner_radius,
            side_holes_inner_radius,
            center = true
        );
    }
    
rotate ([90,0,90])
    difference() {
        $fn = 360;
        cylinder(
            side_holes_height,
            side_holes_outer_Radius,
            side_holes_outer_Radius,
            center = true
        );
        cylinder(
            (side_holes_height + 2),
            side_holes_inner_radius,
            side_holes_inner_radius,
            center = true
        );
    }