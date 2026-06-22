outside = 136;
thickness = 3;
lip_z = outside / 6;

difference() {
    cube([outside, outside, (outside / 2)]);
    translate([thickness, thickness, thickness]) {
        cube(outside - (thickness * 2));
    }
    translate([(thickness / 2), (thickness / 2), ((outside / 2) - lip_z)]) {
        cube([(outside - thickness), (outside - thickness), outside]);
    }
}
 