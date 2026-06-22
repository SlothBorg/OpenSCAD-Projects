top_beam_width = 111.125;
top_beam_depth = 12;
top_beam_height = 12;

leg_beam_width = 12;
leg_beam_depth = 50;
leg_beam_height = 12;

left_offset = 20 - (leg_beam_width / 2);
right_offset = top_beam_width - (20 + (leg_beam_width / 2));


// Top Beam
// width,depth,height
cube(size = [top_beam_width, top_beam_depth, top_beam_height], center = false);

translate([left_offset,0,0]) 
    cube(size = [leg_beam_width, leg_beam_depth, leg_beam_height], center = false);

translate([right_offset,0,0]) 
    cube(size = [leg_beam_width, leg_beam_depth, leg_beam_height], center = false);