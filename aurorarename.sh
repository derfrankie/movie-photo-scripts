#!/bin/bash

n="1"
timeshift="1"
addtime="5"

for f in *.$1; 

    do 
    ##read n
    case $n in
	"1")
		a="a"
        n="2"
        timeshift=$(($timeshift + $addtime))
		;;
	"2")
		a="b"
        n="3"
		;;
	"3")
		a="c"
        n="1"
		;;
    esac
    
# echo "$(basename "$f" .jpg)$a.JPG"
# echo "-DateTimeOriginal+=0:0:0 0:$timeshift:0"
    exiftool -overwrite_original "-DateTimeOriginal+=0:0:0 0:$timeshift:0" "$f"
    mv -- "$f" "$(basename "$f" .$1)$a.$1"; 
    
    done;