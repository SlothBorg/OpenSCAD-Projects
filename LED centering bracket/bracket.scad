// joist to mount to
beam_width = 41.275;
// screw hole
hole_r = 2;
$fn = 100;

ear_x = 2;
ear_y = 12;
ear_z = 5;

bracket_x = beam_width + (ear_x * 2);
bracket_y = 12;
bracket_z = 2;


difference() {
    // x, y, z
    cube([bracket_x, bracket_y, bracket_z], center = true);
  
    cylinder(10, hole_r, hole_r, true);
}

// left ear
translate([(bracket_x * -.5), (bracket_y * -.5), 0])
    cube([ear_x, ear_y, ear_z]);

// right ear
translate([((bracket_x * .5) - ear_x), (bracket_y * -.5), 0])
    cube([ear_x, ear_y, ear_z]);