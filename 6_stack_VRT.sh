#!/bin/bash

source ~/modules.sh

cd $1


l_file=`find . -name 'L*stack' -type f`
for l in $l_file
do
   echo "Running on file:"
   echo $l
   extract=${l:0:45}
   BGW=${extract}_BGW.tif
   name=${l}_VRT.vrt
   echo $BGW
   echo $name
   echo "Executing code..."
   
   echo gdalbuildvrt $name $l -b 1:7 $BGW $l -b 8

done

echo "Done!"
