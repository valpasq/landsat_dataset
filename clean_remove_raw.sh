#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

# Remove raw band TIFFs
#find ./ -name 'L*B*.TIF' -exec rm -v {} \;

# Remove LEDAPS and indicies TIFFs
#find ./ -name 'L*sr*.tif' -exec rm -v {} \;

# Remove brightness temperature TIFFs
#find ./ -name 'L*toa*.tif' -exec rm -v {} \;

# Remove fmask TIFFs
#find ./ -name 'L*cfmask.tif' -exec rm -v {} \;

# Remove stats images (not useful)
#find ./ -name '*.png' -exec rm -v {} \;

# Remove stats files (not useful)
#find ./ -name '*stats.csv' -exec rm -v {} \;

find ./ -name '*_vi*' -exec rm -v {} \;



echo "Done!"