hole_h = 5.75;
hole_r = 6;

riser_h = 6.5;
outter_r = hole_r * 1.75;

base_h = 8;
base_bottom_r = 60;
base_top_r = base_bottom_r - 1.5;

magnet_h = 3.25;
magnet_r = 4;

roundness = 120;

difference() {
    union() {
        cylinder(h = base_h, r1 = base_bottom_r, r2 = base_top_r, $fn = roundness);

        translate([(base_top_r / 3), 0, base_h]) {
            cylinder(h = riser_h, r = outter_r, $fn = roundness);
        }
    }
    
    translate([(base_top_r / 3), 0, ((base_h + riser_h) - hole_h)]) {
        cylinder(h = hole_h, r = hole_r, $fn = roundness);
    }
    
    cylinder(h = magnet_h, r = magnet_r, $fn = roundness);
}