inch = 25.4;
hex_h = 2;
border_height = 2;
border_thickness = 2;
hex_r = 1.5 * inch;

module hexagons() {
    radius = hex_r + border_thickness;
    union() {
        circle(r = radius, $fn = 6);
        translate([(radius * 1.5), (cos(30) * hex_r), 0]) {
            circle(r = radius, $fn = 6);
        }
        translate([(radius * 1.5), (-cos(30) * hex_r), 0]) {
            circle(r = radius, $fn = 6);
        }
    }
}

// the object itself
linear_extrude(hex_h) {
   hexagons();
}

linear_extrude(hex_h + border_height) {
    difference() {
        // outer boundary
        hexagons();
        // remove an inset copy
        offset(-border_thickness) {
            hexagons(); 
        }
    }
}