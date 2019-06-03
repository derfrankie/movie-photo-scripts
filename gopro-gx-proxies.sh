#!/bin/bash

srcExt="GX*.MP4"
destExt="MOV"

srcDir="."
destDir="Proxies"

opts="-vf scale=720:-1 -vcodec prores -profile:v 0"

for filename in "$srcDir"/$srcExt; do

        basePath=${filename%.*}
        baseName=${basePath##*/}

        ffmpeg -i "$filename" $opts "$destDir"/"$baseName"_Proxy."$destExt"

done

echo "Proxy conversion complete!"