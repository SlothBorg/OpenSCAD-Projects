import subprocess
import os

start = 25;
stop = 4;
step = 2;
first_segment = 'true';

openscad = "../OpenSCAD-2026.02.07-x86_64.AppImage"

for size in range(start, stop, -step):
    output_file = f"tentacle_segment_{size}.stl"

    subprocess.run([
        openscad,
        "-o", output_file,
        "-D", f"base_r={size}",
        "-D", f"first_segment={first_segment}",
        "tentacle_segment.scad"
    ], check=True)

    first_segment = 'false';

    print(f"Exported: {output_file}")
