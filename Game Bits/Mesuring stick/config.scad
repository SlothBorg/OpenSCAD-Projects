ROUNDNESS = 60;
TOLERANCE = 1.10;

////////////////////
// Main Segments  //
////////////////////

// Armada = 85
MS_x = 100;
MS_mid_x = (MS_x / 2);
// Armada = 15
MS_y = 25;
MS_mid_y = (MS_y / 2);
// Armada = 5
MS_z = 10;
MS_mid_z = (MS_z / 2);



///////////////////
// Bottom && Top //
//////////////////5
RING_outer_r = MS_mid_y;
RING_inner_r = MS_mid_y * .8;

PEG_outer_r = RING_inner_r * .75;
PEG_inner_r = PEG_outer_r * .8;

CLICK_base_angle = -225;
CLICK_num = 6;
CLICK_r = .75;

// Indicator for which click the tool is on
INDICATOR_h = (MS_z * 1.1);
INDICATOR_r = (MS_y / 8);
INDICATOR_sides = 3;
INDICATOR_num = CLICK_num - 1;