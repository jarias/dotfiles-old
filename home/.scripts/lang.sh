(setxkbmap -query | grep -q "layout:\s\+us") && setxkbmap es || setxkbmap us

setxkbmap -device $(xinput list | grep -o -P 'AT Translated Set 2 keyboard\s+id=\d+' | sed -e 's/AT Translated Set 2 keyboard\s*id=\(.\)/\1/') -option altwin:swap_lalt_lwin
