main_hole_outer_radius = 68;
main_hole_inner_radius = 60;
main_hole_height = 80;

side_holes_outer_radius = 22;
side_holes_inner_radius = 16;
side_holes_height = 240;

module mainBody() {
    cylinder(
        main_hole_height,
        main_hole_outer_radius,
        main_hole_outer_radius,
        center = true,
        $fn = 360
    );
        
    rotate([90,0,90])
        cylinder(
            side_holes_height,
            side_holes_outer_radius,
            side_holes_outer_radius,
            center = true,
            $fn = 360
        );

    rotate([90,0,0])
        cylinder(
            side_holes_height,
            side_holes_outer_radius,
            side_holes_outer_radius,
            center = true,
            $fn = 360
        );
}

module hollowedBody() {
    difference() {
        mainBody();
        
            cylinder(
            (main_hole_height + 2),
            main_hole_inner_radius,
            main_hole_inner_radius,
            center = true,
            $fn = 360
        );
            
        rotate([90,0,90])
            cylinder(
                (side_holes_height + 2),
                side_holes_inner_radius,
                side_holes_inner_radius,
                center = true,
                $fn = 360
            );

        rotate([90,0,0])
            cylinder(
                (side_holes_height + 2),
                side_holes_inner_radius,
                side_holes_inner_radius,
                center = true,
                $fn = 360
            );
    }   
}

hollowedBody();