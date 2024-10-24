module torus(r1=1, r2=2, $fn=100){
    rotate_extrude(convexity=10, $fn=$fn)
    translate([r2, 0, 0])
    circle(r=r1, $fn=$fn);
}


torus(r1=0.5, r2=4);


