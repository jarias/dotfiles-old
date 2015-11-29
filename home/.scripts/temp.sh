sensors | grep ^"Physical id 0:" | awk '{print $4}' | sed 's/\+\(.*\)°C/\1/'
