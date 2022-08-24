thickness = 12;
width = 16;
height = 60;

cube([thickness, width, height], false);


translate([(thickness / 2), (width / 2), height])
    cylinder((thickness / 2), (thickness / 3), (thickness / 3), false);

