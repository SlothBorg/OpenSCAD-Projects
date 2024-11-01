width = 12;
length = 304.8;
height = 6;

nail_r = 1.25;
pen_r = 3.1;

hole_height = height + 2;

difference() {
    cube([width, length, height]);
    
    translate([(width / 2), 0, 0]) {
        cylinder(h=hole_height, r=nail_r, $fn=100);
    }
    
    translate([(width / 2), length, 0]) {
        cylinder(h=hole_height, r=pen_r, $fn=100);
    }
}