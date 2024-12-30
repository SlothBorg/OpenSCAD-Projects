seperator = 4;

$fn = 100;

// Army Painter SpeedPaint bottle 25mm 
// liquitex bottle 36mm 
// Daler-Rowney FW bottle 45mm
cutout_d = 45;

cutout_r = cutout_d / 2;
cutout_h = 14;

rows = 1;
cols = 3;

tray_x = seperator + (cutout_d * cols) + (seperator * cols);
tray_y = seperator + (cutout_d * rows) + (seperator * rows);
tray_z = 15;
tray_bottom = tray_z - cutout_h;

difference() {
    cube([tray_x, tray_y, tray_z]);
    
    for (i = [1 : rows]) {
        for(j = [1: cols]) {
            echo ("hole: ", i, " ", j);
            
            x_offset = (seperator * j) + (cutout_r * j) + (cutout_r * (j - 1));
            y_offset = (seperator * i) + (cutout_r * i) + (cutout_r * (i - 1));
                      
            translate([x_offset, y_offset, tray_bottom]) {
                cylinder(h = cutout_h, r = cutout_r);
            }
        }
    }
}