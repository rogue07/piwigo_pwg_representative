#!/bin/bash

# ram
# ver=0.1
# july 2, 2010 / 20:04
# this script and convert2jpg.sh needs to be in the "galleries" directory
# this script copies and runs convert2jpg.sh in subdirectories

#for f in *
#do
#	[ -d "$f" ] && cd $f && ./convert2jpg.sh && cd ..
#done

#cd ..
rm convert2jpg.log
touch convert2jpg.log
sleep 2
for d in ./*/; do (cp -v convert2jpg.sh "$d" && cd "$d" && bash -x ./convert2jpg.sh && sleep 3) >> convert2jpg.log; done
#for d in ./*/*/; do (cp -v convert2jpg.sh "$d" && cd "$d" && bash -x ./convert2jpg.sh && sleep 3) >> convert2jpg.log; done
exit 1
