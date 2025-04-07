inch = 25.4;
$fn = 120;

top_r = 1.9 * .95 * inch;
height = 2;

washer_h = 0.5;

/**
OPTIONS ARE:
    Is Occult
    Is Script
    Hayghin Daedric - no capitilization
**/
number_font = "Hayghin Daedric";
letter_font = "Is Occult";

numbers = [1, 2, 3, 4, 5, 6, 7, 8];
letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"];

symbol_depth = 1;
scale_factor = 0.8;

module bolt() {
    bolt_r = (5.2 / 2);
    
    cylinder(h = (height * 3), r = bolt_r);
}
module washer() {
    washer_r = (12.8 / 2);
    
    cylinder(h = washer_h, r = washer_r);
}
module numbers_on_face(i) {  
    rotate((360 / len(numbers)) * (i - 1)) {
        translate([(top_r * .5), 0, 0]) {
            scale([scale_factor, scale_factor, scale_factor]) {
                linear_extrude(height = symbol_depth, center=true) {
                    text(str(numbers[i - 1]), font = number_font, halign = "center", valign = "center");
                }
            }
        }
    }
}
module letters_on_face(i) {  
    rotate((360 / len(letters)) * (i - 1)) {
        translate([(top_r * .75), 0, 0]) {
            scale([scale_factor, scale_factor, scale_factor]) {
                linear_extrude(height = symbol_depth, center=true) {
                    text(letters[i - 1], font = letter_font, halign = "center", valign = "center");
                }
            }
        }
    }
}

difference() {
    cylinder(h = height, r = top_r);
    
    bolt();
    washer();
    translate([0, 0, (height - washer_h)]) {
        washer();    
    }
    
    for (i = [1 : len(numbers)]) {
        numbers_on_face(i);
    }
    for (i = [1 : len(letters)]) {
        letters_on_face(i);
    }
}