#!/bin/bash

# ram
# ver=0.2

# 1 July, 2020 / 19:24
# script will convert .mp4 files to .jpg and move them to a new folder

# 4 July, 2020 / 20:14
# runconvert.sh and this script will need to be in the "galleries" folder
# runconvert.sh will call this script. It will then copy this script to your subfolders and run itself there.
# in the subfolder it checks for a pwg_representative folder, it it's not there it creates it.
# it they are files that don't have a corresponding .jpg in the pwg_representative folder, then the file will be processed by ffmpeg.
# added various variables and cleanup tasks
# all logging will be done in the "galleries" folder by the runconvert.sh script. The logfile is called "convert2jpg.log"


#for i in *.mp4; do ffmpeg -ss 00:00:02 -i "$i" -frames:v 1 "${i%.*}.jpg"; done


cd "$(gallery "$0")"		# set this folder as root


# variables
DIR="pwg_representative"	
INPUT="diff.tmp"
OUTPUT=`cat diff.tmp`
COM=$(comm -23 <(find *.mp4 -type f -exec bash -c 'basename "${0%.*}"' {} \; | sort) <(find $DIR/*.jpg -type f -exec bash -c 'basename "${0%.*}"' {} \; | sort))
#LIST=`ls *.mp4 | wc -l && ls pwg_representative/*.jpg | wc -l`


# send compare file names to diff.tmp 
echo "$COM" > "$INPUT"


# create pwg_representative if it isn't there
if [ -d "$DIR" ]; then
	echo "Directory exists, moving on."
else
	echo "Creating directory:"
	mkdir ${DIR}
fi


# for loop to process .mp4 into .jpg using ffmpeg
for i in $OUTPUT
do 
	echo "$i"
	ffmpeg -ss 00:00:02 -i "$i".mp4 -frames:v 1 "${i%.*}.jpg"
	mv -v "${i%.*}.jpg" ${DIR}
	echo $(pwd)
	echo $(ls *.mp4 | wc -l && ls pwg_representative/*.jpg | wc -l)
	sleep 3
done


# clean up
rm $INPUT
chmod 700 -Rf $DIR
chown -Rf www-data:www-data $DIR

exit 1
