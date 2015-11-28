#!/bin/bash
mute=`amixer get Master | grep "Front Left:" | awk '{print $6}'`
vol=`amixer get Master | grep "Front Left:" | awk '{print $5}' | tr -d '[%]'`
if [ $mute == "[on]" ]
then
    if [ $vol == "100" ]
    then 
        echo ""  $vol"%"
    elif [ $vol \< "50" ]
   	then 
        echo ""  $vol"%"
    else
    	echo ""  $vol"%"
    fi
else
    echo "" 
fi