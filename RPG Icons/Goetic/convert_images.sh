#!/bin/bash

# Preprocess for better tracing
mkdir -p demon_seals_processed

for file in demon_seals/*.png; do
    basename=$(basename "$file")
    
    # Clean up the image: increase contrast, remove noise, sharpen
    convert "$file" \
        -background white -alpha remove -alpha off \
        -colorspace gray \
        -contrast-stretch 0 \
        -median 1 \
        -morphology Close Disk:1 \
        "demon_seals_processed/$basename"
done

# Then run potrace on processed images
mkdir -p demon_seals_svg

for file in demon_seals_processed/*.png; do
    basename=$(basename "$file" .png)
    convert "$file" -threshold 50% "temp.pbm"
    potrace "temp.pbm" -s -o "demon_seals_svg/${basename}.svg" --tight
    rm "temp.pbm"
done
