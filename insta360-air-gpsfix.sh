#!/bin/bash

# copy gps tags from INSP files to corresponding jpg files
exiftool -tagsfromfile %d%f.insp -gps:all -r -ext jpg *

# update create date in metadata of files (needed especially for the stitched jpgs)
exiftool "-alldates<filename" *