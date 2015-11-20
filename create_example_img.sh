#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

# First input is location of image directory
here=$1
cd $here

# Second input is file pattern for example images
pattern=$2

# find dir/name of first stack
example=$(find . -name $pattern -type f | head -1)
echo $example

# create example image using gdal translate
gdal_translate -ot Byte -b 1 -of ENVI $example example_img

# view proj info using gdal
proj=$(gdalinfo -proj4 example_img)
echo $proj