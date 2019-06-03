#!/bin/bash


## NICHT VERWENDEN #########################

# regular
exiftool '-filename<CreateDate' -d %Y%m%d-%H%M%S-$1%%-c.%%le -v *

# proxies
cd Proxies
exiftool -ext "*" '-filename<CreateDate' -d %Y%m%d-%H%M%S-$1_Proxy%%-c.%%le -v *
for f in *.MOV; do mv -- "$f" "$(date -r "$f" +%Y%m%d%-H%M%S)-$1_Proxy.mov"; done;

cd ..

# audio
cd Audio
for f in *; do mv -- "$f" "$(date -r "$f" +%Y%m%d%-H%M%S)-$1.wav"; done;
