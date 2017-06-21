#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N landsat_stack
#$ -j y

module load batch_landsat

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1
cd $here

# Name of example image (stack to this extent)
img="/projectnb/landsat/projects/Massachusetts/p012r031/images/LT50120311988166PAC05/LT50120311988166PAC05_all"

# Make temp directories for each sensor
if [ ! -d TMETM ]; then
mkdir TMETM/
fi

if [ ! -d OLI ]; then
mkdir OLI/
fi

# Group images to stack by sensor
n_mtl=$(find ./ -name 'L*MTL.txt' | wc -l)
if [ $n_mtl -eq 0 ]; then
    echo "Error - cannot find any MTL files"
    exit 1
fi

for mtl in $(find ./ -name 'L*MTL.txt'); do
    id=$(basename $(dirname $mtl))
    
    l1t=$(grep "LANDSAT_8" $mtl)

    if [ "$l1t" == "" ]; then
        echo "$id is TM/ETM+"
        mv $(dirname $mtl) TMETM

	# Landsat 8 (OLI)
    else
        echo "$id is OLI"
        mv $(dirname $mtl) OLI
    fi  
done

# Stack Landsat 7 (ETM)
sr="*sr*1.tif *sr*2.tif *sr*3.tif *sr*4.tif *sr*5.tif *sr*7.tif *bt*6.tif"
qa="*bqa.tif"

landsat_stack.py -q -p --files "$sr $qa" \
	--ndv "-9999; -9999; -9999; -9999; -9999; -9999; -9999; 1" \
	--utm 19 -o "_stack" \
	--format "ENVI" --co "INTERLEAVE=BIP" \
	--image="$img" ./TMETM/

# Stack Landsat 8 (OLI)
sr="*sr*2.tif *sr*3.tif *sr*4.tif *sr*5.tif *sr*6.tif *sr*7.tif *bt*10.tif"
qa="*bqa.tif"

landsat_stack.py -q -p --files "$sr $qa" \
    --ndv "-9999; -9999; -9999; -9999; -9999; -9999; -9999; 1" \
    --utm 19 -o "_stack" \
    --format "ENVI" --co "INTERLEAVE=BIP" \
    --image="$img" ./OLI/

# Remove temp directories
mv ./OLI/* ./
mv ./TMETM/* ./
rm -rf ./OLI/
rm -rf ./TMETM/

echo "Done!"
