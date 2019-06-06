# derFrankie Movie & Photo-Scripts

This is a small collections of shell (and some windows batch files) of tools I use in my daily workflow.

They work for me and should inspire you to create your own and can be a base for that.

Most tools invoke other tools and you should have them installed to use these scripts.

* exiftool
* ffmpeg 

## GoPro Scripts

GoPros are great little cameras, but the files structure is a bit a mess, and many don't know, that GoPros create some Proxies which you can re-use to speed up your workflow.

### `fix-gopro-folder.sh`

The one-stop-shop script to fix your folder. It organizes all the contents of the items contained in the DCIM/GOP01 folder. I run it once I have copied all the contents into a project folder. It does the following:

* Moves all .WAV Audio files in a subdir Audio
* Deletes all THMs (small jpeg previews of movies)
* Calls gopro-proxis.sh for smaller proxies
* Calls gopro-gx-proxies.sh for high resolution/high framerate proxies


### `gopro-proxies.sh`

GoPros create proxy files for the mobile app to make it possible to view recordings off you camera directly. You can use those in your Premiere (or other NLE) easily by renaming the files correctly.

This script copies all LRV files from the folder to a subfolder called Proxies and renames them for you to the standard convention for Adobe Premiere.

### `gopro-gx-proxies.sh`

GoPros don't create proxies for all movie resolutions/framerates and this script will generate proxies for these files, as they are the more demanding file types. 

It looks for files with GX in the name and uses ffmpeg to create Prores proxies with 720p resolution. The proxies are stored in a Proxies subfolder and renamed to Adobe Premiere proxy naming convention by adding _Proxy to the file name.


## Insta360 Scripts

### ´insta360-air-gpsfix.sh´

Insta360 makes some great little 360 cameras and I used their first small Android camera the Insta360 Air a lot. The one thing I didn't like was that they didn't export the GPS information captured in the original .INSP (the not stitched format of the images). If you stitch the .INSP into a JPG (which then is used to view it in a player) the information is lost.

This script will transfer the metadata from a .INSP file to a .JPG file with the same name in the same folder.

My Workflow:
1. Stitch and Export all .INSP files with Insta360 Studio to the same folder
2. Run the script in the folder

## Aurora HDR Scripts

### `aurorarename.sh <extension>`

Aurora HDR is a app by Skylum which is quite good at creating HDR photos. They introduced a batch mode in 2018, but it's very limited and the recognition of brackets is faulty.

Especially the recognition of brackets which are captured shortly one after another (like in handheld panorama shots) is buggy and there is no way to re-group the brackets.

This brought me to make this script. Be aware that it will ruin the capture time and filename of the files and you should run it on a copy of your photos **NOT YOUR ORIGINALS**. It is also optimized for brackets of 3 pictures. If you use more pictures per bracket you have to change the script.

The script will do the following:
* Rename each bracket of three set by adding "a" "b" "c"
* Then it will shift the time by 5 more seconds each bracket set it encounters (first 5 seconds, second 10 seconds, ...)

My workflow is:

* Export brackets in JPEG format to a folder
* Run script in the folder on the JPEGs
* Use Aurora HDR Batch mode on the modified JPEGs

Usage:
```
aurorarename.sh <extension>
```
extensions examples: JPG jpg

## Mixed Scripts

### `rename-to-date.sh`

This script renames files based on the creation metadata recorded by the camera. You can add a custom text to add some context to the files. I use it if I have recordings from various cameras and don't need to preserve the original filenames and I don't care with what camera the movie was recorded.

Usage:
```
rename-to-date.sh <custom-text> <file/files>
```

Example: `rename-to-date.sh vacation *.MOV`


### `fix-file-creation-date.sh`

This recursive script will update the file creation date to the one recorded by the camera in the metadata. Works well with Raw, JPG, MOV and DNG files. I use this script mainly to fix files saved on the backup drive by the budget photography travel backup - [more on that project here](https://www.frankie.bz/blog/budget-travel-backup-solution-for-photographers)

Usage:
```
fix-file-creation-date.sh
```
