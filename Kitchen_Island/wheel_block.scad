wheel_r = 64;
wheel_width = 50;

block_width = wheel_r * 1.8;
block_depth = wheel_width * 1.2;
block_height = wheel_width / 2;

$fn=128;


module rounded_cube(d,r) {
    hull() for(p=[[r,r,r], [r,r,d[2]-r], [r,d[1]-r,r], [r,d[1]-r,d[2]-r],
                  [d[0]-r,r,r], [d[0]-r,r,d[2]-r], [d[0]-r,d[1]-r,r], [d[0]-r,d[1]-r,d[2]-r]])
        translate(p) sphere(r);
}

difference() {
    translate([-(block_width/2),-(block_depth/2), 0]) {
        rounded_cube([block_width, block_depth, block_height], 5);
    }
    
    translate([0, (wheel_width/2), wheel_r]) {
        rotate([90, 0, 0]) {
            cylinder(h=wheel_width, r=wheel_r);
        }
    }
}