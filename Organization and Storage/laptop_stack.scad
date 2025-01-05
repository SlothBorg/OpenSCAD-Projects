inch = 25.4;

shelf_x = 18 * inch;
shelf_y = 12 * inch;
shelf_z = .25 * inch;
shelf_wall_x = 1;
shelf_wall_y = 1;
shelf_wall_z = 1;

color([0, .5, 0]) {
    cube([shelf_x, shelf_y, shelf_z]);
}