#!/usr/bin/env bash
image=$1
outputPath="assets/photography"
thumbnailPath="$outputPath/thumbnails"
convert "$image" -resize 888x888 "$thumbnailPath/$image"
exiftool -overwrite_original -all= "$thumbnailPath/$image"
exiftool -all= -tagsfromfile @ -Model -LensModel -FocalLength -ApertureValue -ShutterSpeedValue -ExposureTime -ISO "$image"
mv $image "$outputPath/$image"
