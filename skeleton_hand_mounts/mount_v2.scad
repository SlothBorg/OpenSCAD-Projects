module mount(s_xy=45, t_x=45, s_z=1, h_x=3, h_y=12, h_z=12) {
    difference() {
        linear_extrude(s_z) {
            square(size = s_xy, center = true);
        }
    
        translate_x = 10;
        translate_y = -(s_xy * .5);
        translate_z = (s_z / 2) - (h_z / 2);
        
        translate([translate_x, translate_y, translate_z]) 
            linear_extrude(h_z) {
                square(size=[h_x, h_y], center=true);
            }
            
        translate([-translate_x, translate_y, translate_z])
            linear_extrude(h_z) {
                square(size=[h_x, h_y], center=true);
            }

    }
}

square_xy =  45;
square_z = 10;

translate_x = square_xy * .75;
translate_y = square_xy;

degrees = 120;

hole_x = 5;
hole_y = 20;
hole_z = 4;

hole_translate_x = 10;
hole_translate_y = -(square_xy * .5);
hole_translate_z = (square_z / 2) - (hole_z / 2);



difference() {
    
    hull() {
        mount(square_xy, translate_x, square_z, hole_x, hole_y, hole_z);

        translate([translate_x, translate_y, 0])
            rotate(120)
                mount(square_xy, translate_x, square_z, hole_x, hole_y, hole_z);
            
        translate([-translate_x, translate_y, 0])
            rotate(-120)
                mount(square_xy, translate_x, square_z, hole_x, hole_y, hole_z);
    }

   
    translate([hole_translate_x, hole_translate_y, hole_translate_z]) 
        linear_extrude(hole_z) {
            square(size=[hole_x, hole_y], center=true);
        }
        
    translate([-hole_translate_x, hole_translate_y, hole_translate_z])
        linear_extrude(hole_z) {
            square(size=[hole_x, hole_y], center=true);
        }
        
    translate([translate_x, translate_y, 0])
        rotate(120)
            translate([hole_translate_x, hole_translate_y, hole_translate_z]) 
                linear_extrude(hole_z) {
                    square(size=[hole_x, hole_y], center=true);
                }
                
    translate([translate_x, translate_y, 0])
        rotate(120)
            translate([-hole_translate_x, hole_translate_y, hole_translate_z]) 
                linear_extrude(hole_z) {
                    square(size=[hole_x, hole_y], center=true);
                }
                
    translate([-translate_x, translate_y, 0])
        rotate(-120)
            translate([hole_translate_x, hole_translate_y, hole_translate_z]) 
                linear_extrude(hole_z) {
                    square(size=[hole_x, hole_y], center=true);
                }
                
    translate([-translate_x, translate_y, 0])
        rotate(-120)
            translate([-hole_translate_x, hole_translate_y, hole_translate_z]) 
                linear_extrude(hole_z) {
                    square(size=[hole_x, hole_y], center=true);
                }       
}        