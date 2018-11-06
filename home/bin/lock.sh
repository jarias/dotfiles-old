#!/bin/bash
# suspend message display
pkill -u "$USER" -USR1 dunst

# lock the screen
i3lock -t -n -f -e -d -c 000000 -i ~/Pictures/lock.png

# resume message display
pkill -u "$USER" -USR2 dunst
