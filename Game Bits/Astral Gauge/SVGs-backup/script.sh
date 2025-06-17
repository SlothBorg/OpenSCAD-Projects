for svg in *.svg; do
  filename=$(basename "$svg" .svg)
  echo "Converting $svg to $filename.stl"
  
  # Create a temporary OpenSCAD file
  cat > temp.scad << EOF
  linear_extrude(height=5) 
    import("$svg");
  EOF
  
  # Run OpenSCAD to convert the file
  openscad -o "${filename}.stl" temp.scad
done
rm temp.scad
