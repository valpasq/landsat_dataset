#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N download_landsat
#$ -j y

# email address associated with ESPA account
email=$1

# order number, e.g. espa-valpasq@bu.edu-06122017-142613-752
order=$2

# directory to download to
dir=$3

# ESPA user name and password
user=$4
password=$5

# path for bulk download script
cd /projectnb/landsat/users/valpasq/landsat_dataset/bulk-downloader/

./download_espa_order.py -e $email -o $order \
-d $dir -u $user -p $password

