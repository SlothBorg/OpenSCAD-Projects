inch = 25.4;
hex_h = 2;
border_height = 2;
border_thickness = 2;
hex_r = 1.5 * inch;
num_hexs = 2;

module hexagons(count) {
    radius = hex_r + border_thickness;
    union() {
        for (i = [1 : count]) {
            x_offset = radius * 1.5 * (i - 1);
            y_offset = cos(30) * radius * (i - 1);
            
            translate([x_offset, y_offset, 0]) {
                circle(r = radius, $fn = 6);
            }
        }
    }
}

// the object itself
linear_extrude(hex_h) {
   hexagons(num_hexs);
}

linear_extrude(hex_h + border_height) {
    difference() {
        // outer boundary
        hexagons(num_hexs);
        // remove an inset copy
        offset(-border_thickness) {
            hexagons(num_hexs); 
        }
    }
}