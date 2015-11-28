#!/bin/bash
status=`mpc status | awk '{ if (NR==2) print $1}' | tr -d '[]'`
music=`mpc status | awk '{if (NR==1) print}'`
if [ $status == "playing" ]
then
    echo "  $music"
elif [ $status == "paused" ]
then
	echo "  $music"
else
	echo ""
fi