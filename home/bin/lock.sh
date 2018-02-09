#!/bin/bash
# suspend message display
pkill -u "$USER" -USR1 dunst

scrot /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x9 /tmp/screenshotblur.png
# lock the screen
i3lock -n -f -e -d -c 000000 -i /tmp/screenshotblur.png

# resume message display
pkill -u "$USER" -USR2 dunst
