#!/bin/sh

ESSID=`netctl-auto list | grep \* | sed 's/.*-\(.*\)/\1/'`
echo "<span background=\"#C6F500\" foreground=\"#303030\">   $ESSID </span>"
