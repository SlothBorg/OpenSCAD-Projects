default_roundness = 120;
tolerance_factor = 1.10;

////////////////////
// Main Segments  //
////////////////////

// Armada = 85
segment_x = 100;
midpoint_x = (segment_x / 2);
// Armada = 15
segment_y = 25;
midpoint_y = (segment_y / 2);
// Armada = 5
segment_z = 10;
midpoint_z = (segment_z / 2);

// Indicator for which click the tool is on
indicator_x = ((segment_x - midpoint_y) - (segment_y / 4));
indicator_y = midpoint_y;
indicator_r = (midpoint_y / 4);
indicator_h = (segment_z * 1.1);
indicator_sides = 3;