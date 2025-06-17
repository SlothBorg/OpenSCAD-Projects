#!/bin/bash

# Directory to process (default: current dir)
DIR="${1:-.}"

# Loop over all .svg files
find "$DIR" -type f -name "*.svg" | while read -r file; do
    echo "Processing $file"

    # Remove comment lines
    sed -i '/<!-- Background -->/d' "$file"
    sed -i '/<!-- Title -->/d' "$file"

    # Remove specific rect line
    sed -i '/<rect width="120" height="120" fill="#E9E9E2"\/>/d' "$file"

    # Remove <text> tag where content may vary
    sed -i '/<text x="60" y="110" font-family="serif" font-size="10" fill="#16161D" text-anchor="middle">.*<\/text>/d' "$file"
done
