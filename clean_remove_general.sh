#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1
rmfile=$2

cd $here

# Remove rfile with specified extension
find ./ -name $rmfile -exec rm -v {} \;

echo "Done!"