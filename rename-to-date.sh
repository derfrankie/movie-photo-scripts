#!/bin/bash

exiftool '-filename<CreateDate' -d %Y%m%d-%H%M%S-$1%%-c.%%le -v $2