outerRadius = 16;
innerRadius = 14;
height = 24;
offset = 4;

difference() {
    cylinder(height, (outerRadius - offset), outerRadius, false);
    translate([0, 0, -1])
    cylinder((height + offset), (innerRadius - offset), innerRadius, false);
}
