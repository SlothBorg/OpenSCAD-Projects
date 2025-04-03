#!/bin/bash

for svg in *.svg; do
    # Get the base filename without extension
    filename=$(basename "$svg" .svg)
    echo "Converting $svg to $filename.stl"

    # Create a SCAD file with the same base name
    cat > "${filename}.scad" << 'EOF'
linear_extrude(height=5)
    import("SVGFILE");
EOF

    # Replace the placeholder with the actual filename
    sed -i "s|SVGFILE|$svg|g" "${filename}.scad"

    # Run OpenSCAD to convert the file
    openscad -o "${filename}.stl" "${filename}.scad"

    echo "Generated ${filename}.scad and ${filename}.stl"
done

echo "Conversion complete!"
