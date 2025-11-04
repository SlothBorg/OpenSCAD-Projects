sheet_thickness = 2.05;

card_x = 63.5;
card_y = 88.0;
card_z = .6;

inner_border = 2;
outer_border = 1;
number_of_cards = 3;

outer_x = (card_x * number_of_cards) + (inner_border * (number_of_cards + 1)) + outer_border;
outer_y = card_y + (inner_border * 2) + outer_border;
outer_z = inner_border;

inner_x = outer_x - outer_border;
inner_y = outer_y - outer_border;
inner_z = inner_border - card_z;

difference() {
    cube([inner_x, inner_y, inner_z]);
    
    for (i = [1 : number_of_cards]) {
        x_inset = (outer_border / 2) + (inner_border * i) +  (card_x * (i - 1));
        y_inset = (outer_border / 2) + inner_border;
        z_inset = outer_z - (card_z * 2);

        translate([x_inset, y_inset, (inner_z - card_z)]) {
            cube([card_x, card_y, card_z]);
        }
    }
}
