#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N download_landsat
#$ -j y

source ~/modules.sh

cd /usr3/graduate/valpasq/Documents/landsat_process/bulk-downloader/

python download_espa_order.py -e valpasq@bu.edu \
	-o ALL -c \
	-d /projectnb/landsat/projects/Massachusetts/