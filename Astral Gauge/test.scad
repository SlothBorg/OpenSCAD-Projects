// === Configuration ===
inch = 25.4;
sides = 16;

bottom_radius = 2 * inch;
top_radius = 1.9 * inch;
cylinder_height = 10;

symbol_scale = .25;         // Adjust to match your SVG size
symbol_depth = 0.6;         // Extrusion depth (height of emboss/engrave)
symbol_offset = 6;        // How far from the wall (positive = outside)

// === Tapered Shell ===
module tapered_shell() {
    cylinder(h = cylinder_height, r1 = bottom_radius, r2 = top_radius, $fn = sides);
}

// === Load and extrude SVG symbol ===
module svg_symbol(i) {
    filename = str("symbols/", i, ".svg");
    linear_extrude(height = symbol_depth)
        import(filename);
}

// === Position symbol on side i ===
module symbol_on_facet(i) {
    angle = i * 360 / sides;

    rotate([0, 0, angle])
        translate([bottom_radius - symbol_offset, 0, cylinder_height / 2 - (symbol_depth / 2)])
            rotate([0, 90, 0])  // lay flat against outer wall
                scale([symbol_scale, symbol_scale, 1])
                    svg_symbol(i);
}

// === Final Object ===
//difference() {
    tapered_shell();

    // Cut the symbols into the surface (engraved look)
    for (i = [1 : sides])
        symbol_on_facet(i);
//}
