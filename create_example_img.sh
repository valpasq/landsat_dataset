#!/bin/bash

# find dir/name of first stack
example=$(find . -name 'L*all' -type f | head -1)
echo $example

# create example image using gdal translate
gdal_translate -ot Byte -b 1 -of ENVI $example example_img

# view proj info using gdal
proj=$(gdalinfo -proj4 example_img)
echo $proj