#!/bin/bash
brightness=`xbacklight | colrm 4`
new=`xbacklight | colrm 3`
if [ $brightness == "100" ]
then
    echo " $brightness""%"
else
    echo " $new""%"
fi