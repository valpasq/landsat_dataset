#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

for img in $(find ./ -maxdepth 1 -name 'L*' -type d); do
    echo "Changing bandnames of $img"
    
	perl -p -i.bak -e 's/Band 1/Band 1 Reflectance/g' $img/*stack.hdr
	perl -p -i.bak -e 's/Band 2/Band 2 Reflectance/g' $img/*stack.hdr
	perl -p -i.bak -e 's/Band 3/Band 3 Reflectance/g' $img/*stack.hdr
	perl -p -i.bak -e 's/Band 4/Band 4 Reflectance/g' $img/*stack.hdr
	perl -p -i.bak -e 's/Band 5/Band 5 Reflectance/g' $img/*stack.hdr
 	perl -p -i.bak -e 's/Band 6/Band_6/g' $img/*stack.hdr
 	perl -p -i.bak -e 's/Band 7/Band_7/g' $img/*stack.hdr
	perl -p -i.bak -e 's/Band_6/Band 7 Reflectance/g' $img/*stack.hdr
 	perl -p -i.bak -e 's/Band_7/Band 6 Temperature/g' $img/*stack.hdr
	perl -p -i.bak -e 's/Band 8/Fmask/g' $img/*stack.hdr
	
done
echo "Done"