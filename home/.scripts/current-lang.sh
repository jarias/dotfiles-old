#!/bin/sh

echo "<span background=\"#db00db\" foreground=\"#303030\">" $(setxkbmap -query | awk '/layout/{print $2}') "</span>"
