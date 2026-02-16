hole_depth = 5.3;
hole_r = (16 / 2);

screw_head_depth = 2.6;
screw_head_r = (6.9 / 2);
screw_shaft_r = (3.5 / 2);

roundness = 120; 


difference() {
    cylinder(h = hole_depth, r = hole_r, $fn = roundness);
    
    cylinder(h = hole_depth, r = screw_shaft_r, $fn = roundness);

    translate([0, 0, (hole_depth - screw_head_depth)]) {
        cylinder(h = screw_head_depth, r = screw_head_r, $fn = roundness);
    }
}
