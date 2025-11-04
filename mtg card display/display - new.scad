// Material and card dimensions
sheet_thickness = 2.05;
card_size = [63.5, 88.0, 0.6];
number_of_cards = 3;

// Border spacing
inner_border = 2;
outer_border = 2;  // Increased from 1 to 2

// Calculate tray dimensions
tray_size = [
    card_size[0] * number_of_cards + inner_border * (number_of_cards + 1) + outer_border,
    card_size[1] + inner_border * 2 + outer_border,
    inner_border
];

// Calculate inner cavity dimensions
cavity_size = [
    tray_size[0] - outer_border,
    tray_size[1] - outer_border,
    tray_size[2] - card_size[2]
];

// Build tray
difference() {
    cube(cavity_size);
    
    // Card slots
    for (i = [1 : number_of_cards]) {
        translate([
            outer_border / 2 + inner_border * i + card_size[0] * (i - 1),
            outer_border / 2 + inner_border,
            cavity_size[2] - card_size[2]
        ])
        cube(card_size);
    }
}