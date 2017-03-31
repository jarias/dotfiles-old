#!/bin/sh

TEMP=`sensors | grep ^"Package id 0:" | awk '{print $4}' | sed 's/\+\(.*\)°C/\1/'`

echo "<span background=\"#2F343F\" foreground=\"white\">   $TEMP </span>"
