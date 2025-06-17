torus_r = 20;
hole_r = 5;
torus_sides = 8;

module torus(torus_r, hole_r, sides) {
    $fn = sides;
    
    rotate_extrude(convexity = 10) {
        translate([torus_r, 0, 0]) {
            circle(r = hole_r);
        }
    }
}

torus(torus_r, hole_r, torus_sides);
