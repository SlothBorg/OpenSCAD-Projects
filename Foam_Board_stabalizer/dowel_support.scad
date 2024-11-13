dowel_r = 9.25;
height = dowel_r * 5; 

outer_bottom_r = dowel_r * 1.2;
outer_top_r = dowel_r * 2;


spike_height = dowel_r;
spike_bottom_r = dowel_r / 5;
spike_top_r = .02;

$fn = 100;

difference() {
    cylinder(h = height, r1 = outer_bottom_r, r2 = outer_top_r);
    cylinder(h = height, r = dowel_r);
    
}

translate([0, (outer_top_r * .75), height]) {
    cylinder(spike_height, spike_bottom_r, spike_top_r);
}

translate([(outer_top_r * .75), 0, height]) {
    cylinder(spike_height, spike_bottom_r, spike_top_r);
}

translate([0, -(outer_top_r * .75), height]) {
    cylinder(spike_height, spike_bottom_r, spike_top_r);
}

translate([-(outer_top_r * .75), 0, height]) {
    cylinder(spike_height, spike_bottom_r, spike_top_r);
}