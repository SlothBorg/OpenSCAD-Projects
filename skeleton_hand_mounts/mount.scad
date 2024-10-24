// Diameter of circle in which Triangle is inscribed
small_triangle_r = 60;
large_triangle_r = small_triangle_r * 1.5;

// Height of the Triangle
triangle_height = 6;    

hole_r = 2;
hole_length = 60;

difference() {
    intersection() {
        rotate(30)
            cylinder(r=small_triangle_r, h=triangle_height, center=true, $fn=3);
        rotate(90)
            cylinder(r=large_triangle_r, h=triangle_height, center=true, $fn=3);
    }
    
    translate([0, -40, 0]) 
        rotate([0, 90, 0])
            cylinder(r=hole_r, h=hole_length, center=true, $fn=100);

    translate([-40, 10, 0]) 
        rotate([0, 90, 60])
            cylinder(r=hole_r, h=hole_length, center=true, $fn=100);

    translate([40, 10, 0]) 
        rotate([0, 90, -60])
            cylinder(r=hole_r, h=hole_length, center=true, $fn=100);
}