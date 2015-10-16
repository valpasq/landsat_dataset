#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N landsat_VRT_stack
#$ -j y

source ~/modules.sh

cd $1

l_file=`find . -name 'L*stack' -type f`
for l in $l_file
do
   echo "Running on file:"
   echo $l
   extract=${l:0:45}
   BGW=${extract}_BGW.tif
   VRT=${extract}_VRT.vrt
   echo $BGW
   echo $name
   echo "Executing code..."
   
   gdalbuildvrt -separate $VRT $l -b 1 $1 -b 2 \
   $l -b 3 $l -b 4 $l -b 5 $l -b 6 $l -b 7 \
   $BGW -b 1 $BGW -b 2 $BGW -b 3 $l -b 8

done

echo "Done!"
