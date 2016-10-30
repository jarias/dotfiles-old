#!/bin/sh

mute=`amixer get Master | grep "Mono:" | awk '{print $6}'`
vol=`amixer get Master | grep "Mono:" | awk '{print $4}' | tr -d '[%]'`
if [ $mute == "[on]" ]
then
  if [ $vol == 100 ]
  then
    echo "<span background=\"#2F343F\" foreground=\"white\">    $vol% </span>"
  elif [ $vol \< 50 ]
  then
    echo "<span background=\"#2F343F\" foreground=\"white\">   $vol% </span>"
  else
    echo "<span background=\"#2F343F\" foreground=\"white\">    $vol% </span>"
  fi
else
  echo "<span background=\"#2F343F\" foreground=\"white\">    $vol% </span>"
fi
