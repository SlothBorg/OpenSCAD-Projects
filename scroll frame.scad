height = 80;
bottom_r = 16;
top_r = 2;

steps = 64;

// How far the lower side pulls inward before curving up.
// 1.0 = straight sided at bottom, 0.0 = immediately curves in.
lower_pull = 0.25;

// How wide the column still is when it starts its final taper to the top.
// Higher = stays wider for longer before narrowing.
upper_flare = 3.0;

// start height of the steepest part of the curve
lower_tangent = 0.05;

// end height of the steepest part of the curve
upper_tangent = 0.35;

train_length = 35;
train_width = 35;
train_side = 1;

smoothness = 120;

// Cubic bezier interpolation between four control points
/**
t: position along the curve
    0 = start
    1 = end
p0: start
p1: influences the curve near the start
p2: influences the curve near the end
p3: end
**/
function bezier(t, p0, p1, p2, p3) =
    pow(1-t,3)*p0 + 3*pow(1-t,2)*t*p1 +
    3*(1-t)*pow(t,2)*p2 + pow(t,3)*p3;

// Returns the column's outer radius at a given height z.
function col_r(z) =
    let(t = z / height)
    bezier(t, bottom_r, bottom_r*lower_pull, top_r*upper_flare, top_r);

// The 2D side profile list of [radius, height] points.
profile = [
    for (i = [0:steps])
        let(t = i / steps)
        [
            bezier(t, bottom_r, bottom_r*lower_pull, top_r*upper_flare, top_r),
            bezier(t, 0, height*lower_tangent, height*upper_tangent, height)
        ]
];

rotate_extrude($fn = smoothness)
    polygon(points = concat([[0, 0]], profile, [[0, height]]));

// Build the train as a stack of thin hull() slices running the full height.
// Each slice bridges two heights (z0 bottom, z1 top) and at each height
// hulls together the column's circular cross-section and the train's
// elliptical splay, producing a seamless blend between them.
train_max_height = height;
slices = smoothness - 0;

for (i = [0:slices]) {

    z0 = train_max_height * i / smoothness;
    z1 = train_max_height * (i+1) / smoothness;

    // Normalised position: 1 at ground, 0 at train_max_height
    t0 = 1 - (z0 / train_max_height);
    t1 = 1 - (z1 / train_max_height);

    // Column outer radius at each slice edge, read from the profile curve
    r0 = col_r(z0);
    r1 = col_r(z1);

    // The two middle bezier handles control how late the sweep begins
    
    // the outward extension at the current slice
    splay0 = bezier(t0, 0, train_length * 0.35, train_length * 0.025, train_length);
    splay1 = bezier(t1, 0, train_length * 0.35, train_length * 0.025, train_length);

    // width of the train side to side
    w1 = bezier(t1, 0, train_width * 0.025, train_width * 0.5, train_width);
    w0 = bezier(t0, 0, train_width * 0.025, train_width * 0.5, train_width);
    
    // prevents hull() from receiving a zero-size shape
    s0 = max(splay0, 0.01);
    s1 = max(splay1, 0.01);
    ww0 = max(w0, 0.01);
    ww1 = max(w1, 0.01);

    hull() {
        // Column circle at the bottom edge of this slice
        translate([0, 0, z0]) {
            linear_extrude(0.01) {
                circle(r = r0, $fn = smoothness);
            }
        }

        // Train ellipse at the bottom edge of this slice.
        translate([0, train_side*(r0 + s0 * 0.5), z0]) {
            linear_extrude(0.01) {
                scale([ww0, s0, 1]) {
                    circle(r = 1, $fn = smoothness);
                }
            }
        }

        // Column circle at the top edge of this slice
        translate([0, 0, z1]) {
            linear_extrude(0.01) {
                circle(r = r1, $fn = smoothness);
            }
        }
                

        // Train ellipse at the top edge of this slice
        translate([0, train_side*(r1 + s1 * 0.5), z1]) {
            linear_extrude(0.01) {
                scale([ww1, s1, 1]) {
                    circle(r = 1, $fn = smoothness);
                }
            }
        }
    }
}