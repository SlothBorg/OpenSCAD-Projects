outerRadius = 12;
holeRadius = 2;
height = 24;
offset = 4;

difference() {
    cylinder(height, outerRadius, (outerRadius - offset), false);
    translate([0, 0, (offset * 2)]) 
        cylinder((height - offset), holeRadius, holeRadius, false);
}