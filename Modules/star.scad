// shamelessly taken fromss
// https://gist.github.com/anoved/9622826

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


linear_extrude(10, true)
    star(7, 10, 15);