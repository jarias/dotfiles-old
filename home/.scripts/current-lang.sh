echo $(setxkbmap -query | awk '/layout/{print $2}')
