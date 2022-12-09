$fn=128;

radius = 6;
inner_radius = 3;
bend_radius = 45;
angle_1 = 0;
angle_2 = 180;

union() {
     // lower arm
     rotate([0, 0, angle_1])
          translate([bend_radius + radius, 0.02, 0])
          rotate([90, 0, 0])
          cylinder(r=radius, h=50);
     // upper arm
     rotate([0, 0, angle_2])
          translate([bend_radius + radius, -0.02, 0])
          rotate([-90, 0, 0])
          cylinder(r=radius, h=50);
     // bend
     difference() {
          // torus
          rotate_extrude()
               translate([bend_radius + radius, 0, 0])
               circle(r=radius);
          // torus cutout
          rotate_extrude()
               translate([bend_radius + radius, 0, 0])
               circle(r=inner_radius);
          // lower cutout
          rotate([0, 0, angle_1])
               translate([-50 * (((angle_2 - angle_1) <= 180)?1:0), -100, -50])
               cube([100, 100, 100]);
          // upper cutout
          rotate([0, 0, angle_2])
               translate([-50 * (((angle_2 - angle_1) <= 180)?1:0), 0, -50])
               cube([100, 100, 100]);
     }
} 