#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

# Remove raw band TIFFs
find ./ -name 'L*band[1-11]*.tif' -exec rm -v {} \;
find ./ -name 'L*b[1-11]*.tif' -exec rm -v {} \;
#find ./ -regextype posix-egrep -regex 'L.*[^sr]_band.*.tif' -exec rm -v {} \;

# Remove LEDAPS and indicies TIFFs
find ./ -name 'L*sr*.tif' -exec rm -v {} \;
#find ./ -regextype posix-egrep -regex 'L.*sr_band.*.tif' -exec rm -v {} \;

# Remove brightness temperature TIFFs
find ./ -name 'L*toa*.tif' -exec rm -v {} \;

# Remove fmask TIFFs
find ./ -name 'L*cfmask*' -exec rm -v {} \;

echo "Done!"