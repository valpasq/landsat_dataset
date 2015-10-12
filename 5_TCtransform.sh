#!/bin/bash

source ~/modules.sh

cd $1


l_file=`find . -name 'L*stack' -type f`
for l in $l_file
do
   echo "Running on file:"
   echo $l
   name=${l}_BGW.tif
   echo $name
   echo "Executing code..."
   ~/Documents/misc/spectral/transforms.py -v $l $name brightness greenness wetness

done
