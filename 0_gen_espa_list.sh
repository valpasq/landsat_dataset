
cd /projectnb/landsat/projects/Massachusetts/p012r031/

output=./p012r031_submit.txt

cat ./LSR_LANDSAT_ETM_COMBINED_p012r031.txt | awk -F ',' 'NR > 1 { print $2 }' > $output
cat ./LSR_LANDSAT_TM_p012r031.txt | awk -F ',' 'NR > 1 { print $2 }' >> $output
# cat ./LANDSAT_8_28473.txt | awk -F ',' 'NR > 1 { print $2 }' > $output

n=$(cat ./p012r031_submit.txt | wc -l)

echo "You have $n Landsat images in your text file"