adapter_r = 100;
adapter_h = 5;

spool_hole_r = 52.3 / 2;

cutout_r = adapter_r * .3;
cutout_offset = adapter_r * .6;

$fn = 128;

difference() {
    union() {
        cylinder(h = adapter_h, r = adapter_r);
        cylinder(h = (adapter_h * 2.5), r = spool_hole_r);
    }
    
    for (i = [0 : 5]) {        
        rotate(i * (360 / 5)) {
            translate([0, cutout_offset, 0]) {
                cylinder(h = adapter_h, r = cutout_r);
            }
        }
    }
    
    cylinder(h = (adapter_h * 2.5), r = (spool_hole_r * .8));  
}
