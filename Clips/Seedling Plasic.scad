inch = 25.4;
scale_factor = 1.2;
inner_r = inch / 2;
outter_r = inner_r * scale_factor;
height = 12;
$fn=125;


difference() {
    difference() {
        cylinder(h = height, r = outter_r);
        cylinder(h = height, r = inner_r);
    }
    
    translate([(inner_r * -scale_factor), (inner_r * -(scale_factor * 2.5)), 0]) {
        cube((outter_r * 2));
    }
}
