inch = 25.4;

spool_r = 7.75 * inch;
spool_hole_r = (55.5 / 2);

adaptor_inset = 1;
adaptor_hole_inset = 5;

outter_ring_h = 4;
outter_ring_r = spool_r + 1.5;

$fn = 128;

difference() {
    cylinder(h = outter_ring_h, r = outter_ring_r);
    translate([0, 0, (outter_ring_h - adaptor_inset)]) {
        cylinder(h = adaptor_inset, r = spool_r);
    }
}
cylinder(h = adaptor_hole_inset, r = spool_hole_r);
