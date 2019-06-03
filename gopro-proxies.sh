#!/bin/bash

mkdir Proxies
cp *.LRV Proxies

cd Proxies
rename 's/GL/GH/g;s/.LRV/_Proxy.MP4/g' *
