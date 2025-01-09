inch = 25.4;

spool_r = (7.75 / 2) * inch;
spool_hole_r = (55.5 / 2);

adaptor_r = spool_r + 0.5;
adaptor_h = 5;

hole_insert_h = 20;
hole_insert_r = spool_hole_r;

hole_cutout_r = hole_insert_r * 0.8;

//

adaptor_inset = .5;
adaptor_hole_inset = 20;

outter_ring_h = 1;
outter_ring_r = spool_r + 1.5;

cutout_h = outter_ring_h + 4;
cutout_r = spool_r / 5;
cutout_location_r = spool_r * .66;

angle_to_radian = 3.14159 / 180;

$fn = 128;

difference() {
    union() {
        difference() {
            cylinder(h = outter_ring_h, r = outter_ring_r);
            translate([0, 0, (outter_ring_h - adaptor_inset)]) {
                cylinder(h = adaptor_inset, r = spool_r);
            }
        }
        difference() {
            cylinder(h = adaptor_hole_inset, r = spool_hole_r);
            translate([0,0,-1]) {
            cylinder(h = adaptor_hole_inset * 2, r = (spool_hole_r * .75));
            }
        
        }
    }

    for (i = [0 : 8]) {        
        rotate(i * 45) {
            translate([0, cutout_location_r, 0]) {
                cylinder(h = cutout_h, r = cutout_r);
            }
        }
    }
}