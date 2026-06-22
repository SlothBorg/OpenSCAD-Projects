inch = 25.4;
hex_sm = 3;
hex_md = 5;
hex_lg = 8;
hex_height = 2;
wall_gap   = 0.4;
length = 5 * inch;
width  = 3 * inch;
height = 1.3;
seed = 42;
// col spacing
col = 1.5 * hex_lg;
// row spacing
row = sqrt(3) * hex_lg;   

nx = ceil(length / col) + 2;
ny = ceil(width  / row) + 2;

sizes = [hex_sm, hex_md, hex_lg];

// random index 0..2, seeded per cell so it's stable between renders
function pick_size(i, j) =
    sizes[ min(2, floor(rands(0, 3, 1, seed + i*131 + j*17)[0])) ];

module hexagon(R) {
    cylinder(h = hex_height, r = R - wall_gap/2, $fn = 6);
}

module hex_field() {
    for (i = [-1 : nx]) {
        for (j = [-1 : ny]) {
            translate([ i*col,
                        j*row + (i % 2 ? row/2 : 0),  // stagger odd columns
                        0 ]) {
                hexagon(pick_size(i, j));
            }
        }
    }
}

union() {
    intersection() {
        hex_field();
        cube([length, width, height]);
    }
    cube([length, width, (height / 2)]);
}