$fa = 1;
$fs = 0.5;

seperator = 10;

rows = 2;
cols = 3;

cutout_d = 45;
cutout_r = cutout_d / 2;

tray_x = seperator + (cutout_d * cols) + (seperator * cols);
tray_y = seperator + (cutout_d * rows) + (seperator * rows);
tray_bottom = 2;
tray_z = cutout_r + tray_bottom;

difference() {
    cube([tray_x, tray_y, tray_z]);
    
    for (i = [1 : rows]) {
        for(j = [1: cols]) {
            echo ("hole: ", i, " ", j);
            
            x_offset = (seperator * j) + (cutout_r * j) + (cutout_r * (j - 1));
            y_offset = (seperator * i) + (cutout_r * i) + (cutout_r * (i - 1));
                      
            translate([x_offset, y_offset, (tray_bottom + cutout_r)]) {
                sphere(cutout_r);
            }
        }
    }
}
