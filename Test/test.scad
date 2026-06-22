// Parameters
cube_size = 50;
cube_height = 10;
surface_scale = 1;
surface_height = 20;

// Base cube
cube([cube_size, cube_size, cube_height]);

// Surface heightmap on top of the cube
translate([0, 0, cube_height])
    surface(
        file = "image2.png",   // Convert image1.jpg → image1.png first
        center = false,
        invert = false,
        convexity = 5
    );