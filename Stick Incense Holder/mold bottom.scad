outerRadius = 16;
innerRadius = 14;
height = 2;
offset = 2;
starHeight = 24;
starRadius = 2;

module star(p, d1=0, d2=0, r1=0, r2=0) 
{ R1= r1!=0 ? r1: d1/2;
  D1= d1!=0 ? d1: 2*r1;
  R2= r2!=0 ? r2: d2/2;
  D2= d2!=0 ? d2: 2*r2;
  
  union()
  { for(i=[0:p-1])
    { i1=[cos(i*360/p - 180/p)*R1,sin(i*360/p - 180/p )*R1]; //first inner point
      i2=[cos(i*360/p + 180/p)*R1,sin(i*360/p + 180/p)*R1]; //second inner point
      i3=[cos(i*360/p + 180)*R1,sin(i*360/p + 180)*R1];      //third inner point
      o=[cos(i*360/p)*R2,sin(i*360/p)*R2];                           //outer point
      polygon([i1,o,i2,i3],[[0,1,2,3]]);
    }
  }
}

cylinder(height, (outerRadius + offset), (outerRadius + offset), false);
translate([0, 0, height])
    difference() {
        cylinder(height, (outerRadius + offset), (outerRadius + (2 * offset)), false);
        cylinder((height + offset), outerRadius, (outerRadius + offset), false);
    }

linear_extrude(starHeight, true)
    star(7, starRadius);   