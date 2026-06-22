thickness = 12;
width = 16;
height = 138;

difference() {
    cube([thickness, width, height], false);
    translate([(thickness / 2), (width / 2), 130]) cylinder(thickness, (thickness / 3), (thickness / 3), false);
}

smBranchWidth = 24;

translate([0, (smBranchWidth * -1), 28])
    cube([thickness, smBranchWidth, 18], false);

translate([0, 16, 0])
    cube([thickness, 55, 12], false);