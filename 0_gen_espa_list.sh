#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1
WRS=$2

cd $here

output=./${WRS}_submit.txt

cat ./LSR_LANDSAT_ETM_COMBINED_${WRS}.txt | awk -F ',' 'NR > 1 { print $2 }' > $output
cat ./LSR_LANDSAT_TM_${WRS}.txt | awk -F ',' 'NR > 1 { print $2 }' >> $output
# cat ./LANDSAT_8_28473.txt | awk -F ',' 'NR > 1 { print $2 }' > $output

n=$(cat ./${WRS}_submit.txt | wc -l)

echo "You have $n Landsat images in your text file"