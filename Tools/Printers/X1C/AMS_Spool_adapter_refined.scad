inch = 25.4;

spool_r = ((7.75 / 2) * inch) - 0.25;
spool_hole_r = 55.5 / 2;

adaptor_r = spool_r + 0.5;
adaptor_h = 4;
adaptor_inside = 0.45;

hole_insert_h = 7;
hole_insert_r = spool_hole_r;

hole_cutout_r = hole_insert_r * 0.8;

cutout_h = adaptor_h;
cutout_r = spool_r / 5;
cutout_location_r = spool_r * .66;

$fn = 128;

difference() {
    cylinder(h = adaptor_h, r = adaptor_r);
    translate([0, 0, adaptor_inside]) {
        cylinder(h = (adaptor_h - adaptor_inside), r = spool_r);
    }

    for (i = [0 : 8]) {        
        rotate(i * 45) {
            translate([0, cutout_location_r, 0]) {
                cylinder(h = cutout_h, r = cutout_r);
            }
        }
    }
}

difference() {
    cylinder(h = hole_insert_h, r = spool_hole_r);
    cylinder(h = hole_insert_h, r = (spool_hole_r * .75));
}