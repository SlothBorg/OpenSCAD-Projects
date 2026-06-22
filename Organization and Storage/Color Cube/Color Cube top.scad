outside = 136;
thickness = 3;
lip_z = outside / 6;
tolerance = .4;

difference() {
    cube([outside, outside, (outside / 2)]);
    translate([thickness, thickness, thickness]) {
        cube(outside - (thickness * 2));
    }
   
    color("blue") {
        translate([0, 0, ((outside / 2) - lip_z)]) {
            cube([((thickness / 2) + tolerance), outside, lip_z]);
        }
    }
    color("green") {
        translate([(outside - ((thickness / 2) + tolerance)), 0, ((outside / 2) - lip_z)]) {
            cube([((thickness / 2) + tolerance), outside, lip_z]);
        }
    }
    color("purple") {
        translate([0, 0, ((outside / 2) - lip_z)]) {
            cube([outside, ((thickness / 2) + tolerance), lip_z]);
        }
    }
    color("red") {
        translate([0, (outside - (thickness / 2) - tolerance), (outside / 2) - lip_z]) {
            cube([outside, ((thickness / 2) + tolerance), lip_z]);
        }
    }
}
