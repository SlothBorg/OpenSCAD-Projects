Outer_Radius = 30;
Inner_Radius = 15;
Thickness = 5;

//////////////////////////////////////////////////////
// SHOULDN"T NEED TO EDIT ANYTHING AFTER THIS POINT //
//////////////////////////////////////////////////////

Cube_X = Inner_Radius / 2;
Cube_Y = Inner_Radius * 3;
Cube_Z = Thickness + 1;

Cube_Translation = [
    (Cube_X / 2) * -1,
    Cube_Y * -1,
    (Cube_Z / 2) * -1
];

Cube_Size = [
    Cube_X,
    Cube_Y,
    Cube_Z,
];

difference() {
    $fn = 360;
    cylinder(Thickness, Outer_Radius, Outer_Radius, center = true);
    cylinder((Thickness + 1), Inner_Radius, Inner_Radius, center = true);
    translate(Cube_Translation) 
        cube(Cube_Size, center = false);
}
