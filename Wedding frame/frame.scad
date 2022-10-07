width = 10;
offset = 1;
height = .5;

difference() {
    cube([width, width, height], true);
    cube([(width - offset), (width - offset), (height*2)], true);
}