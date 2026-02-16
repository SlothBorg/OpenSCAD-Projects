inch = 25.4;

slots = 19;
slot_width = .2 * inch;

radius = 2 * inch;
lengths = [
    6 * inch,
    4 * inch,
    2t * inch
];
    
angles = [0, 180];

union() {
    translate([0, -(lengths[1] / 2), 0]) {
        cube(lengths);
    }

    points = [
        for(a = [angles[0]:1:angles[1]]) [radius * cos(a), radius * sin(a)]
    ];

    translate([0, 0, lengths[2]]) {
        rotate([90, 0, 90]) {
            linear_extrude(height = lengths[0])
                polygon(concat([[0, 0]], points));
        }
    }
}