#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N BGW_transform
#$ -j y

source ~/modules.sh

cd $1

l_file=`find . -name 'L*stack' -type f`
for l in $l_file; do
   	echo "Running on file:"
   	echo $l
    extract=${l:0:45}
   	name=${extract}_BGW.tif
   	echo "Name of BGW stack:"
   	echo $name
   	echo "Executing code..."
   	~/Documents/misc/spectral/transforms.py \
   	-v $l $name brightness greenness wetness
done

echo "Done!"