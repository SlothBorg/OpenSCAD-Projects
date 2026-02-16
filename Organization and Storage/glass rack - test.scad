inch = 25.4;

slot_count = 6;
slot_width = 6;
divider_height = 1 * inch;
divider_thickness = .25 * inch;

base_width = 1 * inch;
base_thickness = .3 * inch;
tail_length = 40;

total_slotted_length = (slot_count * slot_width) + ((slot_count + 1) * divider_thickness);
total_length = total_slotted_length + tail_length;

union() {
    difference() {
        cube([total_slotted_length, base_width, divider_height + base_thickness]);
        
        // Subtracting the slots
        for (i = [0 : slot_count - 1]) {
            translate([divider_thickness + i * (slot_width + divider_thickness), -1, base_thickness])
                cube([slot_width, base_width + 2, divider_height + 1]);
        }
    }

    // Tail section
    translate([-tail_length, 0, 0]) {
        difference() {
            cube([tail_length, base_width, divider_height + base_thickness]);
            
            // Rotating a cube to "cut" the slant
            translate([0, -1, base_thickness])
                rotate([0, -atan((divider_height) / tail_length), 0])
                translate([0, 0, 0])
                cube([tail_length * 1.5, base_width + 2, divider_height * 2]);
        }
    }
}