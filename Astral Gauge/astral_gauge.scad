inch = 25.4;
sides = 17;
bottom_r = 2 * inch;
top_r = 1.9 * inch;
height = 10;

inset_r = top_r * .95;
inset_h = 1;

difference() {
    cylinder(h = height, r1 = bottom_r, r2 = top_r, $fn = sides);
    translate([0, 0, (height - inset_h)]) {
        cylinder(h = inset_h, r = inset_r, $fn = 120);
    }
}