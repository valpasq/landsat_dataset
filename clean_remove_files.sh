#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

# Remove raw band TIFFs
#find ./ -name 'L*band*.tif' -exec rm -v {} \;
find ./ -regextype posix-egrep -regex 'L.*[^sr]_band.*.tif' -exec rm -v {} \;

# Remove LEDAPS and indicies TIFFs
#find ./ -name 'L*sr*.tif' -exec rm -v {} \;
find ./ -regextype posix-egrep -regex 'L.*sr_band.*.tif' -exec rm -v {} \;

# Remove brightness temperature TIFFs
#find ./ -name 'L*toa*.tif' -exec rm -v {} \;

# Remove fmask TIFFs
#find ./ -name 'L*cfmask.tif' -exec rm -v {} \;

# Remove stats images (not useful)
#find ./ -name '*.png' -exec rm -v {} \;

# Remove stats files (not useful)
#find ./ -name '*stats.csv' -exec rm -v {} \;

# Remove vi stacks
#find ./ -name '*_vi*' -exec rm -v {} \;

# Remove stacks
#find ./ -name '*_stack*' -exec rm -v {} \;

# Remove BGW
find ./ -name '*_BGW.tif*' -exec rm -v {} \;


echo "Done!"