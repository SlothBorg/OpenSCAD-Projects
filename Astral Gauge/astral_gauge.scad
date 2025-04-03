inch = 25.4;
sides = 16;

bottom_r = 2 * inch;
top_r = 1.9 * inch;
height = 10;

side_angle = 360 / sides;
side_vertical_angle = atan((height / (bottom_r - top_r)));

inset_r = top_r * .95;
inset_h = 1;

module tapered_shell(h, r1, r2, sides) {
    cylinder(h = h, r1 = r1, r2 = r2, $fn = sides);
}

module top_inset(h, r) {
    translate([0, 0, height - h]) {
        cylinder(h = h, r = r, $fn = 120);
    }
}

module svg_symbol(i) {
    filename = str("symbols/", i, ".svg");
    
    echo(str("Loading symbol ", i, "..."));
    
    symbol_depth = 0.6;
    
    linear_extrude(height = symbol_depth) {
        import(filename);
    }
}

module symbol_on_facet(i) {
    angle = i * side_angle;
    scale = .25;
    offset = 0.1;

    rotate(angle) {
        translate([(bottom_r - offset), 0, (height / 2)]) { 
            rotate([0, 90, 0]) {
                scale([scale, scale, 1]) {
                    svg_symbol(i);
                }
            }
        }
    }
}


//difference() {
    tapered_shell(height, bottom_r, top_r, sides);
    top_inset(inset_h, inset_r);
    
    for (i = [1 : sides]) {
        symbol_on_facet(i);
    }
//}




/**
for (i = [0 : sides]) {        
    rotate(i * (360 / sides)) {
            translate([0, bottom_r, 0]) {
                cylinder(h = height, r = 3, $fn = 16);
        }
    }
}
**/