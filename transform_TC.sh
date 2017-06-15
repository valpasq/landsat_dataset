#!/bin/bash
#$ -l h_rt=24:00:00
#$ -V
#$ -N BGW_transform
#$ -j y

cd $1

l_file=`find -L . -name 'L*stack' -type f`
echo $l_file
for l in $l_file; do
   	echo "Running on file:"
   	echo $l
    extract=${l:0:45}
   	name=${extract}_BGW.tif
   	echo "Name of BGW stack:"
   	echo $name
   	echo "Executing code..."
   	python ~/Documents/misc/spectral/transforms.py \
   	-v $l $name brightness greenness wetness
done

echo "Done!"