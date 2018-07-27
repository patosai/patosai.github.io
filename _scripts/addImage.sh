#!/usr/bin/env bash
image=$1
outputPath="assets/photography"
thumbnailPath="$outputPath/thumbnails"

for image in "$@"
do
  echo "processing $image"
  convert "$image" -resize 333x333 "$thumbnailPath/$image"
  exiftool -overwrite_original -all= "$thumbnailPath/$image"

  convert "$image" -resize 888x888 "$outputPath/$image"
  exiftool -overwrite_original -all= -tagsfromfile @ -Model -LensModel -FocalLength -ApertureValue -ShutterSpeedValue -ExposureTime -ISO "$outputPath/$image"
done
