#!/bin/sh

mute=`amixer get Master | grep "Front Left:" | awk '{print $6}'`
vol=`amixer get Master | grep "Front Left:" | awk '{print $5}' | tr -d '[%]'`
if [ $mute == "[on]" ]
then
  if [ $vol == "100" ]
  then
    echo "<span background=\"#db00db\" foreground=\"#303030\">   $vol% </span>"
  elif [ $vol \< "50" ]
  then
    echo "<span background=\"#db00db\" foreground=\"#303030\">  $vol% </span>"
  else
    echo "<span background=\"#db00db\" foreground=\"#303030\">   $vol% </span>"
  fi
else
  echo "<span background=\"#db00db\" foreground=\"#303030\">  $vol% </span>"
fi
