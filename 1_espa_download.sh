#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N download_landsat
#$ -j y

EMAIL=$1
ORDER=$2
DIR=$3

source ~/modules.sh

cd ~/Documents/landsat_process/bulk-downloader/

python download_espa_order.py -e $EMAIL \
	-o $ORDER -c \
	-d $DIR