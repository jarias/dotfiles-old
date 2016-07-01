#!/bin/sh

echo "<span background=\"#2F343F\" foreground=\"white\">" $(setxkbmap -query | awk '/layout/{print $2}') "</span>"
