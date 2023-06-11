main_hole_outer_radius = 25;
main_hole_inner_radius = 20;
main_hole_height = 30;

side_holes_outer_radius = 12;
side_holes_inner_radius = 10;
side_holes_height = 80;

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
            (side_holes_height / 2),
            side_holes_outer_radius,
            side_holes_outer_radius,
            center = false,
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
                ((side_holes_height / 2) + 2),
                side_holes_inner_radius,
                side_holes_inner_radius,
                center = false,
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