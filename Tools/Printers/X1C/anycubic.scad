inch = 25.4;

spool_r = ((7.75 / 2) * inch) - 0.2;
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

edge_hole_r = 2.6;
edge_hole_inset = 5.15 + edge_hole_r;
// distance center to center
edge_hole_distance = 24.25 + (edge_hole_r * 2);
edge_peg_h = 3;


$fn = 128;

difference() {
    cylinder(h = adaptor_h, r = adaptor_r);
    translate([0, 0, adaptor_inside]) {
        cylinder(h = (adaptor_h - adaptor_inside), r = spool_r);
    }
    cylinder(h = adaptor_h, r = (adaptor_r * .8));
    
    
    // cutouts to impreve strength, and reduce fillament useage
/**
    for (i = [0 : 8]) {        
        rotate(i * 45) {
            translate([0, cutout_location_r, 0]) {
                cylinder(h = cutout_h, r = cutout_r);
            }
        }
    }
**/
}

// peg for the central hole
/**
difference() {
    cylinder(h = hole_insert_h, r = spool_hole_r);
    cylinder(h = hole_insert_h, r = (spool_hole_r * .75));
}
**/

// pegs for the holes in cardboard

for (i = [0 : 4]) {        
    rotate(i * 90) {
        union() {
            translate([(edge_hole_distance / 2), (spool_r - edge_hole_inset), 0]) {
                cylinder(h = edge_peg_h, r = edge_hole_r);
            }
            translate([-(edge_hole_distance / 2), (spool_r - edge_hole_inset), 0]) {
                cylinder(h = edge_peg_h, r = edge_hole_r);
            }
        }
    }
}