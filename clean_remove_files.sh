#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1
fileID=$2

cd $here

# General pattern for removing files
find ./ -name $fileID -exec rm -v {} \;

# EXAMPLES:

# Remove stats files (not useful)
#find ./ -name '*stats.csv' -exec rm -v {} \;

# Remove vi stacks
#find ./ -name '*_vi*' -exec rm -v {} \;

# Remove stacks
#find ./ -name '*_stack*' -exec rm -v {} \;

# Remove BGW
#find ./ -name '*_BGW*' -exec rm -v {} \;

# Remove VRT
#find ./ -name '*_VRT.vrt' -exec rm -v {} \;


echo "Done!"