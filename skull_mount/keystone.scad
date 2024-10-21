Height = 235;
Top = 216;
Bottom = 116;
Depth = 40;

Points = [
 // [x, y, z] 
    [(-1 * (Top / 2)), 0, 0],
    [(-1 * (Bottom / 2)), (-1 * Height), 0],
    [(Bottom / 2), (-1 * Height), 0],
    [(Top / 2), 0, 0],
    [(Top / 2), 0,  Depth],
    [(Bottom / 2), (-1 * Height), (Depth + 10)],
    [(-1 * (Bottom / 2)), (-1 * Height), (Depth + 10)],
    [(-1 * (Top / 2)), 0, Depth],
];

Faces = [
    [1, 2, 5, 6],
    [2, 3, 4, 5],
    [3, 4, 7, 0],
    [0, 1, 6, 7],
    [0, 1, 2, 3],
    [7, 6, 5, 4],
];

polyhedron(Points, Faces);
