clearance_z = .6;

card_x = 63.5;
card_y = 88.0;
card_z = clearance_z;

inner_border = 2.5;
number_of_cards = 3;

inner_x = inner_border + (card_x * number_of_cards) + (inner_border * number_of_cards);
inner_y = card_y + (inner_border * 2);
inner_z = 2;

outer_border = 1;
outer_x = inner_x + outer_border;
outer_y = inner_y + outer_border;
outer_z = inner_z + clearance_z;

difference() {
    cube([outer_x, outer_y, outer_z]);
    translate([(outer_border / 2), (outer_border / 2), (outer_z - clearance_z)]) {
        cube([inner_x, inner_y, inner_z]);
    }
    
    for (i = [1 : number_of_cards]) {
        x_inset = (outer_border / 2) + (inner_border * i) +  (card_x * (i - 1));
        y_inset = (outer_border / 2) + inner_border;
        z_inset = outer_z - (clearance_z * 2);

        translate([x_inset, y_inset, (inner_z - card_z)]) {
            cube([card_x, card_y, card_z]);
        }
    }
}
