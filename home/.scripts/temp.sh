#!/bin/sh

TEMP=`sensors | grep ^"Physical id 0:" | awk '{print $4}' | sed 's/\+\(.*\)°C/\1/'`

echo "<span background=\"#FFEE00\" foreground=\"#57531E\">  $TEMP </span>"
