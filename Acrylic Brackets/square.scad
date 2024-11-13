sheet_thickness = 2.05;
wall_thickness = 2;

bracket_edge_length = 50;
bracket_height = 4;

wall_cutout = bracket_edge_length - (wall_thickness * 2);

inner_wall_offset = wall_thickness + sheet_thickness;
inner_wall = bracket_edge_length - (inner_wall_offset * 2);

inner_cutout_offset = inner_wall_offset + wall_thickness;
inner_cutout = bracket_edge_length - (inner_cutout_offset * 2);


difference() {
    cube([bracket_edge_length, bracket_edge_length, bracket_height]);

    translate([wall_thickness, wall_thickness, wall_thickness]) {
        cube([wall_cutout, wall_cutout, wall_thickness]);
    }
}

difference() {
    translate([inner_wall_offset, inner_wall_offset, wall_thickness]) {
        cube([inner_wall, inner_wall, wall_thickness]);
    }

    translate([inner_cutout_offset, inner_cutout_offset, wall_thickness]) {
        cube([inner_cutout, inner_cutout, wall_thickness]);
    }
}