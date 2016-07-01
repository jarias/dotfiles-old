#!/bin/sh

ESSID=`netctl-auto list | grep \* | sed 's/.*-\(.*\)/\1/'`
echo "<span background=\"#2F343F\" foreground=\"white\">    $ESSID </span>"
