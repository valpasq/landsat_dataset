#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N index_calc
#$ -j y

source ~/modules.sh

cd $1

l_file=`find . -name 'L*stack' -type f`
for l in $l_file; do
   	echo "Running on file:"
   	echo $l
      extract=${l:0:45}
   	name=${extract}_index.tif
   	echo "Name of index stack:"
   	echo $name
   	echo "Executing code..."
   	~/Documents/misc/spectral/transforms.py \
   	-v $l $name evi ndvi nbr ndmi 
   	
done

echo "Done!"