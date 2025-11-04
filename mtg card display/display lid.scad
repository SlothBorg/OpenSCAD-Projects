sheet_thickness = 2.05;
card_size = [63.5, 88.0, 0.6];
number_of_cards = 3;

inner_border = 2;
outer_border = 2;

//  tray dimensions
tray_size = [
    card_size[0] * number_of_cards + inner_border * (number_of_cards + 1) + outer_border,
    card_size[1] + inner_border * 2 + outer_border,
    inner_border
];

// inner cavity dimensions
cavity_size = [
    tray_size[0] - outer_border,
    tray_size[1] - outer_border,
    tray_size[2] - card_size[2]
];

// Lid parameters
wall_thickness = 2.5;
acrylic_recess_depth = 0.3;  // How far down the acrylic sits
overhang = 3;  // Lip for acrylic
lid_height = tray_size[2] + sheet_thickness + acrylic_recess_depth;  

difference() {
    // Outer shell
    cube([
        tray_size[0] + wall_thickness * 2,
        tray_size[1] + wall_thickness * 2,
        lid_height + inner_border
    ]);
    
    // Inner cavity for tray
    translate([wall_thickness, wall_thickness, acrylic_recess_depth + sheet_thickness])
    cube([tray_size[0], tray_size[1], tray_size[2] + inner_border]);
    
    // Acrylic lip
    translate([
        wall_thickness + outer_border / 2 + overhang,
        wall_thickness + outer_border / 2 + overhang,
        acrylic_recess_depth
    ])
    cube([
        cavity_size[0] - overhang * 2,
        cavity_size[1] - overhang * 2,
        sheet_thickness
    ]);
    
    // Window cutout
    translate([
        wall_thickness + outer_border / 2 + overhang,
        wall_thickness + outer_border / 2 + overhang,
        0
    ])
    cube([
        cavity_size[0] - overhang * 2,
        cavity_size[1] - overhang * 2,
        acrylic_recess_depth + 0.1
    ]);
}