foam_thickness = 50;
bracket_width = 2;

// ROUNDNESS
$fn = 100;

head_h = bracket_width / 2;
head_r = 4;

shaft_h = foam_thickness * .9;
shaft_start_r = 2;
shaft_end_r = .02;

socket_h = bracket_width * 2;
socket_r = shaft_start_r * .75;

// OBJECT
difference() {
    union() {
        // SCREW HEAD
        cylinder(h=head_h, r=head_r);
        // SCREW SHAFT
        translate([0, 0, head_h]) {
            cylinder(shaft_h, shaft_start_r, shaft_end_r);
        }        
    }
    cylinder(h=socket_h, r=socket_r, $fn=6);
}