#!/bin/bash

# Move Audio
echo "Move Audio"
mkdir Audio
mv *.WAV Audio


# Delete THMs
echo "Delete THMs"
rm *.THMs


# Do LRV Proxies
echo "LRV Proxies"
gopro-proxies.sh
rm *.LRV 

# Do GX Proxies
echo "Do GX Proxies"
gopro-gx-proxies.sh