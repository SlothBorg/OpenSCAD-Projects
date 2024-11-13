sheet_thickness = 2.05;
wall_thickness = 2;

cutout_offset = (wall_thickness * 2) + sheet_thickness;

bracket_edge_length = 50;

module right_triangle(x, y, height) {
    // Define the vertices of the right triangle
    vertices = [[0, 0], [x, 0], [0, y]];

    // Create the 2D polygon 
    linear_extrude(height) {
        polygon(vertices); 
    }
} 


difference() {
    right_triangle(x = bracket_edge_length, y = bracket_edge_length, height = 4); 

    translate([cutout_offset, cutout_offset, wall_thickness]) {
        cube(bracket_edge_length);
    }

    translate([wall_thickness, wall_thickness, wall_thickness]) {
        cube([bracket_edge_length, sheet_thickness, 12]);
    }

    translate([wall_thickness, wall_thickness, wall_thickness]) {
        cube([sheet_thickness, bracket_edge_length, 12]);
    }
}