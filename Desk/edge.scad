desk_z = 30;

desk = [
    desk_z + 2,
    desk_z,
    desk_z
];
edge = [
    desk_z + 2,
    desk_z + 1,
    desk_z + 2
];
roundness = 60;

module rounded_box(size, r) {
    hull() {
        for (x = [r, size.x - r]) {
            for (y = [r, size.y - r]) {
                for (z = [r, size.z - r]) {
                    // Place spheres at the corners to define the hull
                    translate([x, y, z]) {
                        sphere(r = r, $fn = roundness);
                    }
                }
            }
        }
    }
}

difference() {
    rounded_box(edge, 0.5);
    translate([0, 1, 1]) {
        cube(desk);
    }
    cube([0.5, edge[1], edge[2]]);
    
    translate([(edge[0] - 0.5), 0, 0]) {
        cube([0.5, edge[1], edge[2]]);
    }
}