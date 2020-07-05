# piwigo_pwg_representative
Convert .mp4 to .jpg

1. script will convert .mp4 files to .jpg and move them to a new folder

2. runconvert.sh and this script will need to be in the "galleries" folder
3. runconvert.sh will call this script. It will then copy this script to your subfolders and run itself there.
4. in the subfolder it checks for a pwg_representative folder, it it's not there it creates it.
5. it they are files that don't have a corresponding .jpg in the pwg_representative folder, then the file will be processed by ffmpeg.
6. added various variables and cleanup tasks
7. all logging will be done in the "galleries" folder by the runconvert.sh script. The logfile is called "convert2jpg.log"



Enjoy,

Ram
