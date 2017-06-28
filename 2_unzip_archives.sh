#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N landsat_unzip
#$ -j y

if [ -z "$1" ]; then
    echo "Error - please specify a directory with Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

# We want to find things ONLY in our current directory, not in any subfolders
#     So, we use -maxdepth 1 option
#     You could also just use "ls *tar.gz", 
#     but find is good to know because it gives you a lot of control
n=$(find ./ -maxdepth 1 -name '*tar.gz' | wc -l)
i=1

if [ $n -eq 0 ]; then
    echo "Error - could not find any Landsat archives"
    exit 1
fi

for archive in $(find ./ -maxdepth 1 -name '*tar.gz'); do
    echo "<----- $i / $n: $(basename $archive)"

    # Create temporary folder for storage
    mkdir temp
    
    # Extract archive to temporary folder
    tar -xzvf $archive -C temp/
    
    # Use AWK to extract image ID
    id=$(grep "LANDSAT_SCENE_ID" ./temp/*MTL* | tr -d ' ' | awk -F '=' '{ print $2 }' | tr -d '"')
    
    # Move archive into temporary folder
    mv $archive temp/
    
    # Rename archive
    mv temp $id
    
    # Iterate count
    let i+=1
done

echo "Done!"
