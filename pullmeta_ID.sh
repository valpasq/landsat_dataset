#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

# First input is location of image directory
here=$1
cd $here

# Second input is output file name, e.g. output=./p011r031_clear_80.txt
output=$2

echo "image_ID,standard_date,azimuth,elevation" > $output
for mtl in $(find ./ -name '*MTL.txt'); do
    id=$(grep -a -e "LANDSAT_SCENE_ID" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }') 
    date=$(grep -a -e "DATE_ACQUIRED" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }')
    AZ=$(grep -a -e "SUN_AZIMUTH" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }')
    ELEV=$(grep -a -e "SUN_ELEVATION" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }')
    echo "$id, $date, $AZ, $ELEV" >> $output
done     
