$fn = 100;

box_w = 150;
box_h = 20;
pipe_h = 25;
pipe_r = box_w / 2;
wall = 5;

flange_offset = 15;
flange_w = box_w + (flange_offset * 2);
flange_h = 3;


difference() {
    union() {
        hull() {
            cube([box_w, box_w, box_h]);
            translate([(box_w / 2), (box_w / 2), box_h]) {
                cylinder(h = pipe_h, r = pipe_r);
            }
        }
        translate([-flange_offset, -flange_offset, 0]) {
            cube([flange_w, flange_w, flange_h]);
        }
        translate([pipe_r, pipe_r, (box_h + pipe_h)]) {
            cylinder(h = pipe_h, r = pipe_r);
        }
    }

    translate([wall, wall, 0]) {
        cube([(box_w - (wall * 2)), (box_w - (wall * 2)), box_h]);
    }

    translate([pipe_r, pipe_r, box_h]) {
        cylinder(h = box_w, r = (pipe_r - wall));
    }
}