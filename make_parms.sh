#!/bin/bash
npm i
i=1
while read video
do
    echo $video
    sed -e "2 i\ ${video}," param_base.json > param$i.json
    i=$((i + 1))
    npx remotion render src/index.tsx VideoSeqs vdieos/video$i.mp4 --props=param$i.json
done < video_list.txt

