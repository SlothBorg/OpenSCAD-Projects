support_r1 = 50;
support_r2 = 25;
support_h = 127;

hole_r = 8;
hole_depth = 70;

difference() {
    cylinder(r1=support_r1, r2=support_r2, h=support_h, center=true, $fn=160);
    
    translate([0, 0, (support_h / 2)]) {
        cylinder(r=hole_r, h=hole_depth, center=true, $fn=160);
    }
}