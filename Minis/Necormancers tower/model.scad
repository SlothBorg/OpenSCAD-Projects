base_z = 4.50;
base_r = 160;

roundness = 60;

// Tower
base_unit = 30;

tower_height = base_unit * 3;
tower_r = 31.5;

// https://cubic-bezier.com/#.35,0,1,.27
// cubic-bezier(.35, 0, 1, .27)
// Points (0, 0) (0.35, 0) (1, 0.27) (1, 1)
cx1 = 0.35;
cy1 = 0.0;
cx2 = 1.0;
cy2 = 0.27;

function bezier(t, p0, p1, p2, p3) =
    pow(1-t,3)*p0 + 3*pow(1-t,2)*t*p1 +
    3*(1-t)*pow(t,2)*p2 + pow(t,3)*p3;

skeleton_height = base_unit * 2;
skeleton_bottom_r = 60;
skeleton_top_r = 15;

steps = 64;

profile = [
    for (i = [0:steps])
        let(t = i / steps)
        let(bx = bezier(t, 0, cx1, cx2, 1))  // horizontal
        let(by = bezier(t, 0, cy1, cy2, 1))  // vertical
        [
            skeleton_bottom_r + (skeleton_top_r - skeleton_bottom_r) * bx,   // radius
            skeleton_height * by                             // z height
        ]
];

stone_height = base_unit;
stone_bottom_r = 15;
stone_top_r = 55;

// Base
color("black") {
    cylinder(h = base_z, r = base_r, $fn = roundness);
}

// Skeleton Pile
translate([0, 0, base_z]) {
    color("#f3e7d9") {
        rotate_extrude($fn = roundness) {
            polygon(points = concat([[0, 0]], profile, [[0, skeleton_height]]));
        }
    }
}

// Stone
translate([0, 0, (skeleton_height + base_z)]) {
    color("White") {
        cylinder(stone_height, stone_bottom_r, stone_top_r, $fn = roundness);
    }
}

// Tower
translate([0, 0, (tower_height + base_z)]) {
    color("Gray") {
        cylinder(h = tower_height, r = tower_r, $fn = roundness);
    }
}