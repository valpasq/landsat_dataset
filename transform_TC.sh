#!/bin/bash
#$ -l h_rt=24:00:00
#$ -V
#$ -N BGW_transform
#$ -j y

cd $1

l_file=`find -L . -name 'L*stack' -type f`
for l in $l_file; do
   	id=$(basename $(dirname $l))
   	echo "Running on file:"
   	echo $id
   	echo "Executing code..."
   	python /projectnb/landsat/users/valpasq/misc/spectral/transforms.py \
   		-v $l ./$id/${id}_BGW.tif brightness greenness wetness
done

echo "Done!"