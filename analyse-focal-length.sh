#!/bin/bash

# Based on the script by Rob Allen https://akrabat.com/analysing-the-focal-length-of-my-photos/

DIR="$1"
 
if [ "$DIR" == "" ]; then
    echo "Usage: analyse-focal-length.sh {directory}"
    exit
fi
 
exiftool -r -T -focallengthin35mmformat -aperture -lens $DIR > analysis.txt
 
awk '{print $1, $2}' analysis.txt | sort | uniq -c | \
    awk 'BEGIN { OFS = ", " } ; {print $2 $3, $1}' | \
    sort -n > analysis.csv
 
echo -e "\"Focal length\",count\n$(cat analysis.csv)" > analysis.csv
 
echo "Created analysis.csv"